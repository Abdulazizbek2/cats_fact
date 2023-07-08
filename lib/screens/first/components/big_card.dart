import 'package:flutter/material.dart';
import '../../../models/cat_model.dart/cat_model.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    Key? key,
    required this.pair,
  }) : super(key: key);

  final CatModel pair;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.onPrimary, fontSize: 18);

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: MergeSemantics(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pair.text!,
                  style: style.copyWith(fontWeight: FontWeight.w200),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  pair.createdAt.toString(),
                  style:
                      style.copyWith(fontWeight: FontWeight.bold, fontSize: 10),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
