import 'package:ani_lo_medaber_ivrit/enums/verb/grammatical_person.dart';
import 'package:ani_lo_medaber_ivrit/enums/verb/plurality.dart';
import 'package:ani_lo_medaber_ivrit/enums/verb/verb_form.dart';

class VerbInfo {
  final GrammaticalPerson person;
  final Plurality plurality;
  final VerbForm form;

  static const VerbInfo verbInfinitive = VerbInfo._(GrammaticalPerson.none, Plurality.none, VerbForm.infinitive);

  const VerbInfo._(this.person, this.plurality, this.form);

  factory VerbInfo(GrammaticalPerson person, Plurality plurality, VerbForm form) {
    if (!_isValid(person, plurality, form)) {
      throw ArgumentError("Invalid verb parameters");
    }
    return VerbInfo._(person, plurality, form);
  }

  static bool _isValid(GrammaticalPerson person, Plurality plurality, VerbForm form) {
    return _validInfinitive(plurality, person, form) ||
        _validImperative(plurality, person, form) ||
        _validFutureOrPast(plurality, person, form) ||
        _validPresent(plurality, person, form);
  }

  static bool _validPresent(Plurality plurality, GrammaticalPerson person, VerbForm form) {
    return form == VerbForm.present && person == GrammaticalPerson.none && _extendedPlurality.contains(plurality);
  }

  static bool _validFutureOrPast(Plurality plurality, GrammaticalPerson person, VerbForm form) {
    if (form != VerbForm.future && form != VerbForm.past) {
      return false;
    }
    switch (person) {
      case GrammaticalPerson.first:
        return form == VerbForm.future && _simplePlurality.contains(plurality);
      case GrammaticalPerson.second:
      case GrammaticalPerson.third:
        return form == VerbForm.future && _extendedPlurality.contains(plurality);
      case GrammaticalPerson.none:
        return false;
    }
  }

  static bool _validImperative(Plurality plurality, GrammaticalPerson person, VerbForm form) {
    return form == VerbForm.imperative && person == GrammaticalPerson.none && _extendedPlurality.contains(plurality);
  }

  static bool _validInfinitive(Plurality plurality, GrammaticalPerson person, VerbForm form) {
    return form == VerbForm.infinitive && plurality == Plurality.none && person == GrammaticalPerson.none;
  }

  static final List<Plurality> _simplePlurality = [Plurality.singular, Plurality.plural];

  static final List<Plurality> _extendedPlurality = [
    Plurality.singularFem,
    Plurality.singularMasc,
    Plurality.pluralFem,
    Plurality.pluralMasc
  ];
}
