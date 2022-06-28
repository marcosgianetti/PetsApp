import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pets_app/ui/components/compnents.dart';

class GlobalWidgets {
  static Future<void> msgAlert({
    required BuildContext context,
    String? title,
    String? content,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
    EdgeInsetsGeometry? padding,
    bool showCloseIcon = true,
    bool barrierDismissible = true,
    Widget? child,
  }) async {
    await showGeneralDialog(
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black.withOpacity(0.5),
      context: context,
      transitionBuilder: (context, a1, a2, widget2) => Transform.scale(
        scale: a1.value,
        child: Opacity(
          opacity: a1.value,
          child: AlertDialog(
            title: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                ),
                child: Stack(
                  children: <Widget>[
                    child ??
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            padding: padding,
                            child: textTitlecenterNoOver(text: "$title", fontSize: 18),
                          ),
                        ),
                    Visibility(
                      visible: showCloseIcon,
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(MdiIcons.close)),
                          )),
                    ),
                  ],
                )),
            contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            titlePadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            content: Visibility(
              visible: child == null,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: crossAxisAlignment,
                mainAxisAlignment: mainAxisAlignment,
                children: <Widget>[
                  const Divider(),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
                    child: TextApp(content ?? "", size: 16),
                  ),
                ],
              ),
            ),
            shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.white30,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
          ),
        ),
      ),
      transitionDuration: const Duration(milliseconds: 240),
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) => const SizedBox(),
    );
  }

  static Widget textTitlecenterNoOver({required String text, double? fontSize = 22, Color? textcolor}) {
    return Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize, color: textcolor));
  }

  static Widget svgImage(
    BuildContext context, {
    required String svgPath,
    double? width,
    double? height,
    EdgeInsets margin = const EdgeInsets.fromLTRB(0, 8, 0, 0),
  }) {
    return Container(
      margin: margin,
      child: SvgPicture.asset(
        svgPath,
        width: width,
        height: height,
      ),
    );
  }
}
