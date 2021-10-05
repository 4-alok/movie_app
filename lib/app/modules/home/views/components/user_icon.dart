import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/services/auth.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({
    Key? key,
    required this.radius
  }) : super(key: key);
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: radius,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: ClipOval(
          child: CachedNetworkImage(
            placeholder: (_, __) => Icon(Icons.perm_identity_rounded),
            imageUrl: Get.find<AuthServices>().user!.photoURL!,
            errorWidget: (_, __, ___) => Icon(Icons.perm_identity_rounded),
            fit: BoxFit.cover,
          ),
        ));
  }
}
