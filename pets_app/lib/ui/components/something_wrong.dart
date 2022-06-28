import 'package:flutter/material.dart';

import 'compnents.dart';

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
        children: const [Icon(Icons.error_outline_outlined), TextApp('Algo deu errado, tente novamente mais tarde')],
      ),
    );
  }
}
