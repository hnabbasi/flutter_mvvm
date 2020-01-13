import 'package:flutter/cupertino.dart';

class BaseViewModel extends ChangeNotifier {

  String title;

  Object setValueAndNotify(Object value) {
    notifyListeners();
    return value;
  }
}