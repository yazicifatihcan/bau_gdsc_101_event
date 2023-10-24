import 'dart:convert';

import 'package:bau_gdsc_101_event/app/components/general_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../app/components/character_card.dart';
import '../../app/constants/enums.dart';
import 'character_detail_screen.dart';
import '../../app/constants/http_url.dart';
import '../../app/models/all_characters_response_model.dart';

class AllCharacterScreenSetState extends StatefulWidget {
  const AllCharacterScreenSetState({super.key});

  @override
  State<AllCharacterScreenSetState> createState() => _AllCharacterScreenSetStateState();
}

class _AllCharacterScreenSetStateState extends State<AllCharacterScreenSetState> {
  List<Result> characters = [];
  LoadingStatusEnum loadingStatus = LoadingStatusEnum.LOADING;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    loadingStatus = LoadingStatusEnum.LOADING;
    final response = await http.get(
      Uri.https(HttpUrl.baseUrl, HttpUrl.allCharactersEndpoint),
    );
    if (response.statusCode == 200) {
      characters = AllCharactersResponseModel.fromJson(jsonDecode(response.body)).results!;
      loadingStatus = LoadingStatusEnum.LOADED;
    } else {
      loadingStatus = LoadingStatusEnum.ERROR;
    }
    setState(() {});
  }

  void onTapCharacterDetail(int id) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CharacterDetailScreenSetState(
                  id: id,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///App Bar
      appBar: AppBar(
        title: const Text('All Characters Set State')
      ),

      ///Body
      body: GeneralStateWidget(
          loadingStatus: loadingStatus,
          child: ListView.separated(
            itemBuilder: (context, index) {
              final item = characters[index];
              return CharacterCard(
                character: item,
                onTap: () => onTapCharacterDetail(item.id!),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 16,
            ),
            itemCount: characters.length,
          )),
    );
  }
}
