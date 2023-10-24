import 'dart:convert';

import 'package:get/get.dart';

import '../../../../app/constants/enums.dart';
import 'package:http/http.dart' as http;
import '../../../../app/constants/http_url.dart';
import '../../../../app/models/character_detail_model.dart';

class CharacterDetailGetXController extends GetxController {


  final Rx<LoadingStatusEnum> _loadingStatus=Rx(LoadingStatusEnum.LOADING);
  final Rx<CharacterDetailModel> _character = Rx(CharacterDetailModel());

  LoadingStatusEnum get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatusEnum value) => _loadingStatus.value=value;

  CharacterDetailModel get character => _character.value;
  set character(CharacterDetailModel value) => _character.value=value;


  final int id;
  CharacterDetailGetXController({required this.id, });



   @override
  void onReady() async{
    super.onReady();
    try{
      loadingStatus=LoadingStatusEnum.LOADING;
      await getCharacterDetail();
      loadingStatus=LoadingStatusEnum.LOADED;
    }catch(e){
      loadingStatus=LoadingStatusEnum.ERROR;
    }
  }


   Future<void> getCharacterDetail()async{
    final response = await http.get(
      Uri.https(HttpUrl.baseUrl, HttpUrl.characterDetailEndpoint(id)),
    );
    if (response.statusCode == 200) {
      character = CharacterDetailModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }




}