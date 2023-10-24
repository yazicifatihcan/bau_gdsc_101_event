import 'package:bau_gdsc_101_event/app/components/general_character_view.dart';
import 'package:bau_gdsc_101_event/app/components/general_state_widget.dart';
import 'package:bau_gdsc_101_event/features/get_x/character_detail_screen/controller/character_detail_get_x_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterDetailGetXView extends GetView<CharacterDetailGetXController> {
  const CharacterDetailGetXView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text('Character Detail GetX')),      


      body: Obx(()=>GeneralStateWidget(
        loadingStatus: controller.loadingStatus,
        child: GeneralCharacterView(character: controller.character),
      )),
    );
  }
}