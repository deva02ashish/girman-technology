import 'package:flutter/cupertino.dart';
import 'package:girman_technology/src/bussiness_layer/provider/header_menu_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderRegistration {
  ProviderRegistration._();
  static List<SingleChildWidget> getProviders(BuildContext context) {
    return [
      ChangeNotifierProvider<HeaderMenuProvider>(
        lazy: true,
        create: (context) => HeaderMenuProvider(),
      )
    ];
  }
}
