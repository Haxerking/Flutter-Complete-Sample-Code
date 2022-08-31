
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:module_complete/screens/widgets/preview_image_widget.dart';

// import '../../common/app_colors.dart';
// import '../../common/app_size_helper.dart';


// class CustomImagePicker extends StatefulWidget {
//   int controllerType, index;
//   CustomImagePicker(
//       {Key? key, required this.controllerType, required this.index})
//       : super(key: key);

//   @override
//   State<CustomImagePicker> createState() => _CustomImagePickerState();
// }

// class _CustomImagePickerState extends State<CustomImagePicker> {
//   void _setImageFileListFromFile(XFile? value) {
//     List<XFile>? imageFileList = value == null ? null : <XFile>[value];
  
//   //   if (widget.controllerType == 0) {
//   //     Get.put(ExpenseVoucherController())
//   //         .addSelectedImages(imageFileList![0].path);
//   //   } else if (widget.controllerType == 1) {
//   //     Get.put(PettyCashCertificateController())
//   //         .addSelectedImages(imageFileList![0].path, widget.index);
//   //   } else if (widget.controllerType == 2) {
//   //     Get.put(CashDepositController())
//   //         .addSelectedImages(imageFileList![0].path, widget.index);
//   //   }
//   }

//   dynamic _pickImageError;
//   bool isVideo = false;

//   String? _retrieveDataError;

//   final ImagePicker _picker = ImagePicker();
//   final TextEditingController maxWidthController = TextEditingController();
//   final TextEditingController maxHeightController = TextEditingController();
//   final TextEditingController qualityController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     // return _handlePreview();
//   }

//   // Widget _previewImages() {
//   //   final Text? retrieveError = _getRetrieveErrorWidget();
//   //   if (retrieveError != null) {
//   //     return retrieveError;
//   //   }
//   //   final dynamic controller;
//   //   if (widget.controllerType == 0) {
//   //     // return GetX<ExpenseVoucherController>(
//   //     //     init: ExpenseVoucherController(),
//   //     //     builder: (data) {
//   //     //       List<dynamic> imageFileList = data.imagesList;

//   //     //       return showWidegts(imageFileList);
//   //     //     });
//   //   } else if (widget.controllerType == 1) {
//   //     // return GetX<PettyCashCertificateController>(
//   //     //     init: PettyCashCertificateController(),
//   //     //     builder: (data) {
//   //     //       List<dynamic> imageFileList = data.imagesList;

//   //     //       return showWidegts(imageFileList);
//   //     //     });
//   //   } else if (widget.controllerType == 2) {
//   //     // return GetX<CashDepositController>(
//   //     //     init: CashDepositController(),
//   //     //     builder: (data) {
//   //     //       List<dynamic> imageFileList = data.imagesList;

//   //     //       return showWidegts(imageFileList);
//   //     //     });
//   //   } else {
//   //     return const Text("No getx controller assigned");
//   //   }
//   // }

//   // Widget _handlePreview() {
//   //   return _previewImages();
//   // }

//   Future<void> _onImageButtonPressed(ImageSource source,
//       {BuildContext? context, bool isMultiImage = false}) async {
//     try {
//       final XFile? pickedFile =
//           await _picker.pickImage(source: source, imageQuality: 50);

//       _setImageFileListFromFile(pickedFile);
//     } catch (e) {
//       // setState(() {
//       //   _pickImageError = e;
//       // });
//     }
//   }

//   Text? _getRetrieveErrorWidget() {
//     if (_retrieveDataError != null) {
//       final Text result = Text(_retrieveDataError!);
//       _retrieveDataError = null;
//       return result;
//     }
//     return null;
//   }

//   // Future<void> retrieveLostData() async {
//   //   final LostDataResponse response = await _picker.retrieveLostData();
//   //   if (response.isEmpty) {
//   //     return;
//   //   }
//   //   if (response.file != null) {
//   //     _setImageFileListFromFile(response.file);
//   //   }
//   // }

//   Widget _showUploadWIdget() {
//     return InkWell(
//       onTap: () => _onImageButtonPressed(
//         ImageSource.camera,
//         context: context,
//         isMultiImage: true,
//       ),
//       child: Container(
//           height: 100,
//           width: 100,
//           decoration: const BoxDecoration(
//             color: AppColors.whiteColor,
//             //    border: Border.all(color: AppColors.borderColor,strokeAlign: StrokeAlign.center),
//           ),
//           child: const Icon(
//             Icons.add,
//             color: AppColors.whiteShade3,
//           ),
//         ),
//     );
//   }

//   Widget showWidegts(List<dynamic> imageFileList) {
//     if (imageFileList.isNotEmpty) {
//       return SizedBox(
//         height: 100,
//         child: ListView.separated(
//           separatorBuilder: (context, index) => const SizedBox(
//             width: AppSizeHelper.sizeDefault,
//           ),
//           shrinkWrap: true,
//           key: UniqueKey(),
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (BuildContext context, int index) {
//             return Row(
//               children: [
//                 (imageFileList.length == index)
//                     ? _showUploadWIdget()
//                     : Stack(
//                         // alignment: Alignment.topRight,.
//                         fit: StackFit.passthrough,
//                         children: [
//                           PreviewImageWidget(
//                               path: imageFileList[index], imageType: 0),
//                           Positioned(
//                             right: -15,
//                             top: -15,
//                             child: IconButton(
//                                 onPressed: () {
//                                   // if (widget.controllerType == 0) {
//                                   //   Get.put(ExpenseVoucherController())
//                                   //       .removeSelectedImages(index);
//                                   // } else if (widget.controllerType == 1) {
//                                   //   Get.put(PettyCashCertificateController())
//                                   //       .removeSelectedImages(index);
//                                   // } else if (widget.controllerType == 2) {
//                                   //   Get.put(CashDepositController())
//                                   //       .removeSelectedImages(index);
//                                   // }
//                                 },
//                                 icon: const Icon(
//                                   Icons.circle,
//                                   size: 25,
//                                   color: AppColors.errorColor,
//                                 )),
//                           )
//                         ],
//                       ),
//               ],
//             );
//           },
//           itemCount: imageFileList.length + 1,
//         ),
//       );
//     } else if (_pickImageError != null) {
//       return Text(
//         'Pick image error: $_pickImageError',
//         textAlign: TextAlign.center,
//       );
//     } else {
//       return _showUploadWIdget();
//     }
//   }

//   // Widget _showPreviewImageWidget(String path) {
//   //   return InkWell(
//   //     child: Hero(
//   //       tag: path,
//   //       child: SizedBox(
//   //           height: 100,
//   //           width: 100,
//   //           child: ClipRRect(
//   //             borderRadius: BorderRadius.circular(ScreenConstant.sizeDefault),
//   //             child: Image.file(File(path), fit: BoxFit.cover),
//   //           )),
//   //     ),
//   //     onTap: () => navigationRoutes.navigateToImageView(path, context),
//   //   );
//   // }
// }

// typedef OnPickImageCallback = void Function(
//     double? maxWidth, double? maxHeight, int? quality);
