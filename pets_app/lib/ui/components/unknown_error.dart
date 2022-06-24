import 'package:flutter/material.dart';

import 'global_widgets.dart';

void unknownError(BuildContext context) {
  GlobalWidgets.msgAlert(
    context: context,
    title: 'Algo deu errado :(',
    content: "Tente novamente mais tarde!",
  );
}
