
/// Extension to convert amount to formatted string number to use to parse to int.
extension NumberString on String{
  String formatStringToNumberString(){
    return this.replaceAll(RegExp(r'[^0-9]'), ''); 
  }
}
