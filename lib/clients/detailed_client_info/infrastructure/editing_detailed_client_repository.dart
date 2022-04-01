import 'package:astra_curator/clients/detailed_client_info/domain/i_editing_detailed_client_repository.dart';
import 'package:astra_curator/core/domain/failure/failure.dart';
import 'package:astra_curator/core/domain/models/client_detailed_info_model.dart';
import 'package:astra_curator/core/infrastructure/http/api_client.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Represent editing detailed client info repository.
@LazySingleton(as: IEditingDetailedClientRepository)
class EditingDetailedClientInfoRepository
    implements IEditingDetailedClientRepository {
  final ApiClient _apiClient;

  EditingDetailedClientInfoRepository(this._apiClient);
  @override
  Future<Either<Failure, ClientDetailedInfoModel>> fetchClientDetailedInfo(
    int id,
  ) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return right(_dummyData);
  }

  @override
  Future<Either<Failure, Unit>> updateClientDetailedInfo(int id) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return right(unit);
  }
}

const _dummyData = ClientDetailedInfoModel(
    character:
        "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    skills:
        "survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    orientation:
        "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
    emotionality:
        "Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.",
    intellectuality:
        "Nulla ac nunc vehicula, iaculis eros vel, tincidunt elit. Nunc vel rhoncus elit. Donec faucibus elit sit amet fermentum scelerisque. Aliquam id feugiat tortor, et tincidunt risus. Nunc non erat est. Curabitur finibus lectus at eleifend luctus. Vestibulum et arcu ut ligula vulputate venenatis.",
    sociability:
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, ",
    selfRating:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque vitae hendrerit urna, in tempus ipsum. Vivamus suscipit feugiat dolor, ac convallis nisi tempor id. Mauris mattis sapien a elit pulvinar, vel imperdiet tellus luctus. Proin scelerisque leo eget elit aliquet, eu viverra sem aliquet. Vestibulum urna nibh, semper id purus a, maximus imperdiet eros. Ut non augue sit amet justo dignissim hendrerit. Donec aliquet tortor et justo volutpat placerat. Suspendisse in augue cursus nulla congue pharetra. Cras ullamcorper egestas enim. Integer ac luctus lorem. In efficitur nunc quis orci fermentum, in condimentum metus faucibus. Nam ultrices, ex sed interdum mollis, nibh mauris hendrerit neque, dapibus hendrerit ligula diam vitae metus. Phasellus tincidunt, odio eget pretium vehicula, dolor orci convallis libero, eget imperdiet neque felis et lectus.",
    volitionally:
        "Ut sed gravida ex. Vivamus dictum tristique enim ut efficitur. Donec vel ante sem. Maecenas vehicula risus ut lorem facilisis, et faucibus libero semper. Vivamus rhoncus dui ex. Vivamus at ultrices odio. In hac habitasse platea dictumst. Ut rhoncus arcu id vulputate pellentesque. Integer a volutpat nisi. Donec fringilla, diam nec bibendum porttitor, leo nibh dignissim dui, eu tempor sapien nisl nec lorem. Nulla sit amet porta odio. Nulla ut enim id dui tincidunt laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
    selfControl: "");
