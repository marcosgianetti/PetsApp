import 'package:flutter/material.dart';

import 'global_widgets.dart';

class SomethingWrogn extends StatelessWidget {
  const SomethingWrogn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline_outlined),
          GlobalWidgets.textSimpleSize(text: 'Algo deu errado, tente novamente mais tarde')
        ],
      ),
    );
  }
}
