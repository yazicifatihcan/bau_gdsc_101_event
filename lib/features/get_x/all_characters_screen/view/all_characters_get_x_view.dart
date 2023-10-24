import 'package:bau_gdsc_101_event/app/components/general_state_widget.dart';
import 'package:bau_gdsc_101_event/features/get_x/all_characters_screen/controller/all_characters_get_x_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../app/components/character_card.dart';

class AllCharactersGetxView extends GetView<AllCharactersGetxController> {
  const AllCharactersGetxView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
      appBar: AppBar(
        title: const Text('All Characters Getx')
      ),


      body: Obx(()=>GeneralStateWidget(
          loadingStatus: controller.loadingStatus,
          child: ListView.separated(
            itemBuilder: (context, index) {
              final item = controller.characters[index];
              return CharacterCard(
                character: item,
                onTap: () => controller.onTapCharacterDetail(context: context,id:item.id!),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 16,
            ),
            itemCount: controller.characters.length,
          ))),
    );
  }
}
