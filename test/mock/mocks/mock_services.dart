import 'package:astra_curator/clients/clients/application/clients_bloc.dart';
import 'package:astra_curator/core/domain/services/i_pagination_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPaginationService extends Mock implements IPaginationService {}
