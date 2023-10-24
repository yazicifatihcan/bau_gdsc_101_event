import 'package:bau_gdsc_101_event/features/get_x/character_detail_screen/controller/character_detail_get_x_controller.dart';
import 'package:bau_gdsc_101_event/features/get_x/character_detail_screen/view/character_detail_get_x_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CharacterDetailGetXScreen extends StatelessWidget {
  const CharacterDetailGetXScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CharacterDetailGetXController(id:id ),
      builder: (_)=>const CharacterDetailGetXView(),
    );
  }
}