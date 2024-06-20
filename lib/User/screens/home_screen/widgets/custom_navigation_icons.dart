import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../providers/authentication_provider.dart';
import '../../../auth/blocs/authentication_bloc/authentication_bloc.dart';

class CustomNavigationIcons extends StatelessWidget {
  const CustomNavigationIcons({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
  });

  final String image, text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        radius: 30,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
