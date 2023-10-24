import 'package:flutter/material.dart';

import '../constants/enums.dart';

class GeneralStateWidget extends StatelessWidget {
  const GeneralStateWidget({super.key, required this.child, required this.loadingStatus});

  final LoadingStatusEnum loadingStatus;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return loadingStatus == LoadingStatusEnum.LOADING
          ? const Center(child: CircularProgressIndicator.adaptive())
          : loadingStatus == LoadingStatusEnum.ERROR
              ? const Center(child: Text('An error occurred'))
              : child;
  }
}

