import 'package:flutter/material.dart';

import '../utils/asset_const.dart';
import '../utils/style.dart';
import 'default_image_view.dart';

class DefaultProfileImageHead extends StatelessWidget {
  final double width;
  final double height;
  final String? imageUrl;
  final double borderWidth;
  final Color borderColor;
  final EdgeInsets iconMargin;
  final bool isShowCameraIcon;
  final VoidCallback? onPressedImage;
  final VoidCallback? onPressedCameraIcon;

  const DefaultProfileImageHead({
    Key? key,
    this.imageUrl,
    this.width = 135,
    this.height = 135,
    this.borderWidth = 1,
    this.onPressedImage,
    this.onPressedCameraIcon,
    this.isShowCameraIcon = true,
    this.borderColor = kPrimaryColor,
    this.iconMargin = const EdgeInsets.only(top: 8, right: 6),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              child: InkWell(
                onTap: onPressedImage,
                child: IgnorePointer(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: DefaultImageView(
                      height: double.infinity,
                      width: double.infinity,
                      placeHolderIcon: userPlaceholderAsset,
                      imageUrl: imageUrl ?? userPlaceholderAsset,
                      isLocalAsset: imageUrl == null,
                      imageRadius: imageUrl != null ? 100 : 0,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
            ),
            if (isShowCameraIcon) ...[
              GestureDetector(
                onTap: onPressedCameraIcon,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: iconMargin,
                    width: 35.0,
                    height: 35.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.25),
                        width: 1,
                      ),
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Icon(Icons.camera_alt,color: kPrimaryColor,),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
