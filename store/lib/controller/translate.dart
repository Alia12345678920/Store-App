import 'package:get/get.dart';
//Translations كلاس جاهز في قت اكس
class Translate implements Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    "ar":{
      "a":"الصفحة الرئيسية",
      "b":"السلة",
      "c":"الملاحظات",
      "d":"عربي",
      "e":"انجليزي",
      "f":"السلة فارغة",
      "g":"المفضلة",
  "i":"لا توجد اي عناصر",
      "h":"لا توجد اي ملاحظات",
      "s":"الإعدادات",
      "l":"اختار اللغة : ",
     "z":"اختار الثيم"

},
    "en":{
      "a":"Home page",
      "b":"cart",
      "c":"notes",
      "d":"arabic",
      "e":"english",
      "f":"The cart is impty",
      "g":"favorite",
      "i":"There are no favorite items",
      "h":"There are no notes",
      "s":"setting",
      "l":"choose the language : ",
      "z":"choose Theme"

    },
  };
}