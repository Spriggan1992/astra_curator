import 'package:astra_curator/clients/clients/domain/models/client.dart';
import 'package:astra_curator/core/domain/failure/failure.dart';

import 'mock_image_model.dart';

class MockClientData {
  static final ClientModel client = ClientModel(
    id: 1,
    curatorId: 2,
    phoneNumber: '+79998887755',
    firstName: 'Тест',
    lastName: 'Тестеров',
    height: 185,
    gender: 'М',
    status: 'В активном поиске',
    haveChild: false,
    country: 'Россия',
    city: 'Москва',
    profileInfo: 'short description',
    createdAt: '2022-01-23T16:17:46Z',
    savedAt: '2022-01-23T16:17:47Z',
    isActive: true,
    draft: true,
    isHidden: false,
    showInfo: true,
    curatorFirstname: 'Куратор',
    curatorLastname: 'Кураторович',
    likesAmount: 3,
    profilePhotos: [MockImageModel.imageModel],
    curatorPhotos: [MockImageModel.imageModel],
  );

  static final ClientModel clientEmpty = ClientModel.empty();
}
