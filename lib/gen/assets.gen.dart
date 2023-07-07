/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  String get backArrow => 'assets/icons/back_arrow.svg';
  String get pwInvisibleCustomIcon => 'assets/icons/pwInvisibleCustomIcon.svg';
  String get pwVisibleCustomIcon => 'assets/icons/pwVisibleCustomIcon.svg';
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  AssetGenImage get logoSin =>
      const AssetGenImage('assets/images/logo_sin.png');
  AssetGenImage get splashLoader =>
      const AssetGenImage('assets/images/splash_loader.gif');
}

class $AssetsLocalesGen {
  const $AssetsLocalesGen();

  String get enUS => 'assets/locales/en-US.json';
}

class $AssetsLogosGen {
  const $AssetsLogosGen();

  AssetGenImage get appicon => const AssetGenImage('assets/logos/appicon.png');
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLocalesGen locales = $AssetsLocalesGen();
  static const $AssetsLogosGen logos = $AssetsLogosGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
