import 'dart:io';

import 'package:flutter/material.dart';
import 'package:module_complete/app_globel_data.dart';

import '../../common/app_colors.dart';
import 'get_nework_image.dart';

class FullImagePreview extends StatelessWidget {
  String path;

  FullImagePreview({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.bgLight1,
          child: Stack(
            children: [
              Hero(
                tag: path,
                child: Center(
                  // child: Image.file(File(path), fit: BoxFit.contain),
                  child: GetNetworkImage(url: path),
                ),
              ),
              InkWell(
                  onTap: () =>GlobelData().navigationRoutesHelper.navigateToPreviousScreen(),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: AppColors.whiteShade4,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.close,
                        color: AppColors.linkTextColor,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
