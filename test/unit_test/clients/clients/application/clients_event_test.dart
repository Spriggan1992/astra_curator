import 'package:astra_curator/clients/clients/application/clients_bloc.dart';
import 'package:astra_curator/clients/clients/application/clients_sort_types.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ClientsEvent', () {
    test('ClientsEvent load clients', () {
      expect(
        const ClientsEvent.loadClients(isRefreshItems: true),
        const ClientsEvent.loadClients(isRefreshItems: true),
      );
    });
    test('ClientsEvent sort items', () {
      expect(
        const ClientsEvent.sortClients(SortTypes.sortById),
        const ClientsEvent.sortClients(SortTypes.sortById),
      );
    });
  });
}
