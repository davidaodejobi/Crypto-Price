import 'package:flutter/material.dart';

class IconWithBadge extends StatelessWidget {
  const IconWithBadge({
    required this.child,
    required this.value,
    this.color = Colors.red,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final String? value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            height: 13,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              // ignore: unnecessary_null_comparison
              color: color! != null
                  ? color
                  : Theme.of(context).colorScheme.secondary,
            ),
            constraints: const BoxConstraints(
              minWidth: 15,
              minHeight: 10,
            ),
            child: Center(
              child: FittedBox(
                child: Text(
                  value!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 8,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
