import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget image() {
  return SizedBox(
    // width: MediaQuery.of(context).size.width / 1.5,
    child: CachedNetworkImage(
      imageUrl:
          "https://in5.s3.ap-south-1.amazonaws.com/winners/2020/VT9uYYL97G9Zl0F7wWOiLstOJamZGm7jjq3fvNx0.png",
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    ),
  );
}
