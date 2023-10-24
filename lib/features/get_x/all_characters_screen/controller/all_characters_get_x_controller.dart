import 'dart:convert';

import 'package:bau_gdsc_101_event/features/get_x/character_detail_screen/character_detail_get_x_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

import '../../../../app/constants/enums.dart';
import '../../../../app/constants/http_url.dart';
import '../../../../app/models/all_characters_response_model.dart';

class AllCharactersGetxController extends GetxController {

  final Rx<LoadingStatusEnum> _loadingStatus=Rx(LoadingStatusEnum.LOADING);
  final Rx<List<Result>> _characters = Rx([]);

  LoadingStatusEnum get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatusEnum value) => _loadingStatus.value=value;

  List<Result> get characters => _characters.value;
  set characters(List<Result> value) => _characters.value=value;





  @override
  void onReady() async{
    super.onReady();
    try{
      loadingStatus=LoadingStatusEnum.LOADING;
      await getAllCharacters();
      loadingStatus=LoadingStatusEnum.LOADED;
    }catch(e){
      loadingStatus=LoadingStatusEnum.ERROR;
    }
  }


  Future<void> getAllCharacters()async{
    final response = await http.get(
      Uri.https(HttpUrl.baseUrl, HttpUrl.allCharactersEndpoint),
    );
    if (response.statusCode == 200) {
      characters = AllCharactersResponseModel.fromJson(jsonDecode(response.body)).results!;
    } else {
      throw Exception();
    }
  }


  void onTapCharacterDetail({required BuildContext context,required int id}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CharacterDetailGetXScreen(
                  id: id,
                )));
  }

}