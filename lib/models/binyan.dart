import 'package:ani_lo_medaber_ivrit/enums/binyan_type.dart';
import 'package:ani_lo_medaber_ivrit/enums/foreign_lang.dart';
import 'package:ani_lo_medaber_ivrit/enums/hebrew_lang.dart';
import 'package:flutter/material.dart';

const Map<BinyanType, Binyan> binyans = {
  BinyanType.paal: Binyan.paal,
  BinyanType.piel: Binyan.piel,
  BinyanType.hifil: Binyan.hifil,
  BinyanType.hitpael: Binyan.hitpael,
  BinyanType.nifal: Binyan.nifal,
  BinyanType.pual: Binyan.nifal,
  BinyanType.hufal: Binyan.hufal
};

class Binyan {
  final Map<HebrewLang, String> names;
  final Map<ForeignLang, String> transliterations;
  final Color color;
  final Icon icon;

  static const Binyan paal = Binyan._(
    names: {
      HebrewLang.simple: 'פעל',
      HebrewLang.nikkud: 'פָּעַל',
    },
    transliterations: {
      ForeignLang.en: 'Pa\'al',
      ForeignLang.ru: 'Пааль',
    },
    color: Colors.red,
    icon: Icon(Icons.music_note),
  );

  static const Binyan piel = Binyan._(
    names: {
      HebrewLang.simple: 'פעל',
      HebrewLang.nikkud: 'פִּעֵל',
    },
    transliterations: {
      ForeignLang.en: 'Pi\'el',
      ForeignLang.ru: 'Пиэль',
    },
    color: Colors.blue,
    icon: Icon(Icons.lightbulb),
  );

  static const Binyan hifil = Binyan._(
    names: {
      HebrewLang.simple: 'הפעיל',
      HebrewLang.nikkud: 'הִפְעִיל',
    },
    transliterations: {
      ForeignLang.en: 'Hif\'il',
      ForeignLang.ru: 'Хифиль',
    },
    color: Colors.deepPurple,
    icon: Icon(Icons.airplanemode_active),
  );

  static const Binyan hitpael = Binyan._(
    names: {
      HebrewLang.simple: 'התפעל',
      HebrewLang.nikkud: 'הִתְפַּעֵל',
    },
    transliterations: {
      ForeignLang.en: 'Hitpa\'el',
      ForeignLang.ru: 'Хитпаэль',
    },
    color: Colors.teal,
    icon: Icon(Icons.sunny),
  );

  static const Binyan nifal = Binyan._(
    names: {
      HebrewLang.simple: 'נפעל',
      HebrewLang.nikkud: 'נִפְעַל',
    },
    transliterations: {
      ForeignLang.en: 'Nif\'al',
      ForeignLang.ru: 'Нифаль',
    },
    color: Colors.orange,
    icon: Icon(Icons.pets),
  );

  static const Binyan pual = Binyan._(
    names: {
      HebrewLang.simple: 'פעל',
      HebrewLang.nikkud: 'פֻּעַל',
    },
    transliterations: {
      ForeignLang.en: 'Pu\'al',
      ForeignLang.ru: 'Пуаль',
    },
    color: Colors.lime,
    icon: Icon(Icons.key),
  );

  static const Binyan hufal = Binyan._(
    names: {
      HebrewLang.simple: 'הופעל',
      HebrewLang.nikkud: 'הוּפַּעַל',
    },
    transliterations: {
      ForeignLang.en: 'Huf\'al',
      ForeignLang.ru: 'Хуфаль',
    },
    color: Colors.green,
    icon: Icon(Icons.rocket_launch),
  );

  const Binyan._({
    required this.names,
    required this.transliterations,
    required this.color,
    required this.icon,
  });
}
