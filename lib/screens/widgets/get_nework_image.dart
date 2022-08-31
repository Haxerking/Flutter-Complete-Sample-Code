import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


import '../../common/app_size_helper.dart';
import '../../common/custom/button_loading_widget.dart';

class GetNetworkImage extends StatelessWidget {
  String url;

  GetNetworkImage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizeHelper.sizeDefault),
      child: InteractiveViewer(
        panEnabled: true, // Set it to false
        boundaryMargin: const EdgeInsets.all(100),
        minScale: 0.5,
        maxScale: 2,
        child: CachedNetworkImage(
            imageUrl: url,
            fadeInDuration: const Duration(milliseconds: 500),
            imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
            placeholder: (context, url) => const ButtonLoadingWidget(),
            errorWidget: (context, url, error) {
    
              return const Icon(Icons.error);
            }),
      ),
    );
  }
}
