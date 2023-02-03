import 'package:flutter/material.dart';
import 'package:json_placeholder/utility/default.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    Key? key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: Default.defaultPadding),
      height: size.height * 0.2,
      child: Container(
        padding: const EdgeInsets.only(
            left: Default.defaultPadding,
            right: Default.defaultPadding,
            bottom: Default.defaultPadding + 36),
        height: size.height * 0.2,
        decoration: BoxDecoration(
          color: Default.getcolorDefault,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(36),
            bottomRight: Radius.circular(36),
          ),
        ),
        child: Row(
          children: [
            Text(
              "JsonPlaceholder",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Image.asset("assets/icons/icon-json(xxhdpi).png")
          ],
        ),
      ),
    );
  }
}
