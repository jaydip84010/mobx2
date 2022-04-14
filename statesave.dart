import 'package:mobx/mobx.dart';

part 'statesave.g.dart';

class StateSave = StateSaveBase with _$StateSave;

abstract class StateSaveBase with Store {
  @observable
  String image = '';

  @observable
  String name = "";

  @observable
  String email = "";

  @action
  void changeName(String value) {
    name = value;
  }

  @action
  void changeImage(String value) {
    image = value;
  }

  @action
  void changeEmail(String value) {
    email = value;
  }
}
