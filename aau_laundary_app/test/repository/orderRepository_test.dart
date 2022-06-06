

import 'package:aau_laundary_app/data_providers/orderDataProvider/orderRemoteDataProvider.dart';
import 'package:aau_laundary_app/models/models.dart';
import 'package:aau_laundary_app/repository/appRepository.dart';
import 'package:flutter_test/flutter_test.dart';



import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

import 'orderRepository_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late OrderRepository orderRepository;
  setUp(() {
    orderRepository =
        OrderRepository(orderDataProvider: OrderRemoteDataProvider());
  });

  group('fetch Data from the Order data provider', () {
    test('returns an Order data  if the http call completes successfully',
        () async {
      final client = MockClient();

      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async =>
              http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      expect(orderRepository.getAllOrder(client: client), isA<Order>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(orderRepository.getAllOrder(client: client), throwsException);
    });
  });
}
