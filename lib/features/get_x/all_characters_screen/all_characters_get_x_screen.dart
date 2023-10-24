import 'package:bau_gdsc_101_event/features/get_x/all_characters_screen/controller/all_characters_get_x_controller.dart';
import 'package:bau_gdsc_101_event/features/get_x/all_characters_screen/view/all_characters_get_x_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AllCharactersGetxScreen extends StatelessWidget {
  const AllCharactersGetxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AllCharactersGetxController(),
      builder: (_) => const AllCharactersGetxView(),
    );
  }
}