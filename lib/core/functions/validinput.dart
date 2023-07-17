import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Utilisateur non valide";
    }
  }
  if (type == "text") {}
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "E-mail non valide";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Téléphone non valide";
    }
  }

  if (val.isEmpty) {
    return "Champ non valide";
  }

  if (val.length < min) {
    return "  Champ non valide ";
  }

  if (val.length > max) {
    return "Champ non valide";
  }
}
