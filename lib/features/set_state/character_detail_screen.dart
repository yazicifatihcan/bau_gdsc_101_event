import 'dart:convert';
import 'package:bau_gdsc_101_event/app/components/general_state_widget.dart';
import 'package:bau_gdsc_101_event/app/constants/enums.dart';
import 'package:bau_gdsc_101_event/app/models/character_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../app/components/general_character_view.dart';
import '../../app/constants/http_url.dart';


class CharacterDetailScreenSetState extends StatefulWidget {
  const CharacterDetailScreenSetState({super.key, required this.id}); 

  final int id;

  @override
  State<CharacterDetailScreenSetState> createState() => _CharacterDetailScreenSetStateState();
}

class _CharacterDetailScreenSetStateState extends State<CharacterDetailScreenSetState> {
  LoadingStatusEnum loadingStatus=LoadingStatusEnum.LOADING;
  CharacterDetailModel character=CharacterDetailModel();

  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
    loadingStatus = LoadingStatusEnum.LOADING;
    final response = await http.get(
      Uri.https(HttpUrl.baseUrl, HttpUrl.characterDetailEndpoint(widget.id)),
    );

    if (response.statusCode == 200) {
      character = CharacterDetailModel.fromJson(jsonDecode(response.body));
      loadingStatus = LoadingStatusEnum.LOADED;
    } else {
      loadingStatus = LoadingStatusEnum.ERROR;
    }
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text('Character Detail Set State')),

      body: GeneralStateWidget(loadingStatus: loadingStatus, child: GeneralCharacterView(character: character)),

    );
  }
}

