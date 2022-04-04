import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/core/presentation/widgets/containers/gradient_border_container.dart';
import 'package:astra_curator/core/presentation/widgets/popup/core/text_field_popup_menu_item.dart';
import 'package:flutter/material.dart';

/// Represent text field with popup menu.
class TextFieldPopUpMenu<T> extends StatefulWidget {
  /// Whether the popup menu fit to text field size.
  ///
  /// By default is false, that means popup menu will fit to the size of text field.
  final bool isFullSize;

  /// Initial value of selected value.
  final TextFieldPopUpMenuItem? initialValue;

  /// Text that suggests what sort of input the field accepts.
  final String hint;

  /// Pop up menu items.
  final List<TextFieldPopUpMenuItem> items;

  /// Select item event handler.
  final Function(TextFieldPopUpMenuItem selectedItem) onSelected;

  /// Whether the menu is disabled.
  final bool isDisabled;

  const TextFieldPopUpMenu({
    Key? key,
    required this.items,
    required this.hint,
    required this.onSelected,
    this.initialValue,
    this.isFullSize = false,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  State<TextFieldPopUpMenu> createState() => _TextFieldPopUpMenuState();
}

class _TextFieldPopUpMenuState<T> extends State<TextFieldPopUpMenu<T>>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _sizeTransition;
  late final Animation<double> _rotation;
  final _focusNode = FocusNode();
  final _textController = TextEditingController();
  final GlobalKey _key = LabeledGlobalKey("pop_up_menu");
  bool _isMenuOpen = false;
  late Offset _buttonPosition;
  late Size _buttonSize;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    _listenTextFieldFocus();
    _setUpAnimations();
    _textController.text = widget.initialValue?.title ?? '';

    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    _animationController.dispose();
    _focusNode.dispose();
    if (_overlayEntry != null) {
      _overlayEntry?.dispose();
    }
    super.dispose();
  }

  // Sets up controllers for animation.
  void _setUpAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _sizeTransition = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceIn,
    );
    _rotation = Tween(
      begin: 0.0,
      end: 0.5,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        _isMenuOpen = !_isMenuOpen;
      }
    });
  }

  // Sets up element from pop up menu.
  void _selectItem(TextFieldPopUpMenuItem value) {
    _textController.text = value.title;
    widget.onSelected(value);
    _focusNode.unfocus();
  }

  // Listens the change focus.
  void _listenTextFieldFocus() {
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && _isMenuOpen) {
        _closeMenu();
      }
    });
  }

  // Finds the position of the text field on the screen.
  void findTextField() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    _buttonSize = renderBox.size;
    _buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  // Close popup menu.
  void _closeMenu() {
    _animationController.reverse();
  }

  // Open popup menu.
  void _openMenu() {
    findTextField();
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context)?.insert(_overlayEntry!);
    _isMenuOpen = !_isMenuOpen;
    _animationController.forward();
  }

  // Gets the radius of the popup element based on index.
  BorderRadius? _getRippleBorderRadius(int index) {
    const double radius = 16;
    if (index == 0) {
      return const BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      );
    } else if (index == widget.items.length - 1) {
      return const BorderRadius.only(
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      );
    } else {
      return null;
    }
  }

  // Build overlay entry.
  OverlayEntry _overlayEntryBuilder() {
    final screenSized = MediaQuery.of(context).size;
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: _buttonPosition.dy + _buttonSize.height,
          left: widget.isFullSize
              ? _buttonPosition.dx
              : _buttonPosition.dx + screenSized.width * 0.05,
          width: widget.isFullSize
              ? _buttonSize.width
              : _buttonSize.width - screenSized.width * 0.1,
          child: SizeTransition(
            sizeFactor: _sizeTransition,
            child: GradientBorderContainer(
              height: widget.items.length > 2 ? 156 : null,
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    widget.items.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: _getRippleBorderRadius(index),
                          onTap: () => _selectItem(widget.items[index]),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  widget.items[index].title,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                if (index != widget.items.length - 1)
                                  const Divider(
                                    height: 0,
                                    endIndent: 10,
                                    indent: 10,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: _key,
      focusNode: _focusNode,
      controller: _textController,
      enabled: widget.items.length > 1 && !widget.isDisabled,
      readOnly: true,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: AstraColors.black04),
        suffixIcon: widget.items.length > 1 && !widget.isDisabled
            ? RotationTransition(
                turns: _rotation,
                child: const RotatedBox(
                  quarterTurns: 3,
                  child: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    size: 20,
                    color: AstraColors.black,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        focusedBorder:
            Theme.of(context).inputDecorationTheme.focusedBorder!.copyWith(
                  borderSide: const BorderSide(color: AstraColors.dividerColor),
                ),
      ),
      onTap: () {
        if (_isMenuOpen) {
          _closeMenu();
        } else {
          _openMenu();
        }
      },
    );
  }
}
