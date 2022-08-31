// import 'dart:io';

// import 'package:flutter/material.dart';

// import '../../app_globel_data.dart';
// import '../../common/app_colors.dart';
// import '../../common/app_size_helper.dart';
// import 'get_nework_image.dart';


// class PreviewImageWidget extends StatelessWidget {
//   String path;
//   int imageType;
//   PreviewImageWidget({Key? key, required this.path, required this.imageType})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//     return InkWell(
//       onTap: imageType == 0
//           ? () => null
//           : () =>GlobelData().navigationRoutesHelper.navigateToImageView(path, context),
//       child: Hero(
//         tag: path,
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border.all(color: AppColors.whiteShade4),
//             borderRadius: BorderRadius.circular(AppSizeHelper.sizeDefault),
//           ),
//           height: 100,
//           width: 100,
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(AppSizeHelper.sizeDefault),
//             child: imageType == 0
//                 ? Image.file(File(path), fit: BoxFit.cover)
//                 : GetNetworkImage(url: path),
//           ),
//         ),
//       ),
//     );
//   }
// }
