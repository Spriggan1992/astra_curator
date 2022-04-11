// import 'dart:developer';

// import 'package:astra_curator/clients/clients/domain/models/client.dart';
// import 'package:astra_curator/clients/clients/infrastructure/DTOs/client_DTO.dart';
// import 'package:astra_curator/core/domain/models/pagination_model.dart';
// import 'package:astra_curator/core/infrastructure/http/endpoints.dart';
// import 'package:astra_curator/core/infrastructure/services/pagination_service/pagination_service.dart';
// import 'package:astra_curator/core/presentation/widgets/pagination/pagination_list.dart';
// import 'package:flutter/material.dart';

// final list = [
//   'dsa',
//   '223213',
//   'dsa',
//   '223213',
//   'dsa',
//   '223213',
//   'dsa',
//   '223213',
//   'dsa',
//   '223213',
//   'dsa',
//   '223213',
//   'dsa',
//   '223213',
//   'dsa',
//   '223213',
// ];

// class TempScreen extends StatefulWidget {
//   const TempScreen({Key? key}) : super(key: key);

//   @override
//   State<TempScreen> createState() => _TempScreenState();
// }

// class _TempScreenState extends State<TempScreen> {
//   List<ClientModel> _clientModel = [];

//   final PaginationService<List<ClientModel>> _paginationService =
//       PaginationService(Endpoints.clients.profiles, (data) {
//     return data
//         .map((e) => ClientDTO.fromJson(e as Map<String, dynamic>).toDomain())
//         .toList();
//   });
//   bool isLoad = false;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PaginationList<ClientModel>(
//         items: _clientModel,
//         isAvailableToLoad: isLoad,
//         buildContent: (item) => Text(item.fullName),
//         nextMessagesLoaded: () async {
//           final response = await _paginationService.fetchData();
//           await Future.delayed(const Duration(milliseconds: 500));
//           response.fold((l) => log(l.toString()), (client) {
//             setState(() {
//               _clientModel = client;
//             });
//             log(_clientModel.toString());
//           });
//           setState(
//             () {
//               isLoad = true;
//             },
//           );
//         },
//       ),
//     );
//   }
// }
