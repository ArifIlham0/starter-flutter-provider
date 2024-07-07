import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:starter_frontend_flutter/theme.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    this.isButton,
  });

  final bool? isButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeInOut(
        size: isButton == null ? 50 : 25,
        itemBuilder: (_, int index) {
          return isButton == null
              ? DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: index.isEven ? kGreen : kDarkGrey),
                )
              : DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: index.isEven
                        ? Color(kWhite.value)
                        : Color(kDarkGrey.value),
                  ),
                );
        },
      ),
    );
  }
}
