class VerbInfo {
  final GrammaticalPerson person;
  final Plurality plurality;
  final VerbForm form;

  static const VerbInfo verbInfinitive = VerbInfo._(GrammaticalPerson.none, Plurality.none, VerbForm.infinitive);

  const VerbInfo._(this.person, this.plurality, this.form);

  factory VerbInfo(GrammaticalPerson person, Plurality plurality, VerbForm form) {
    if (!_isValid(person, plurality, form)) {
      throw ArgumentError(
          "Invalid verb parameters: person=${person.name}, plurality=${plurality.name}, form=${form.name}");
    }
    return VerbInfo._(person, plurality, form);
  }

  static bool _isValid(GrammaticalPerson person, Plurality plurality, VerbForm form) {
    return _validInfinitive(plurality, person, form) ||
        _validPresentOrImperative(plurality, person, form) ||
        _validPast(plurality, person, form) ||
        _validFuture(plurality, person, form);
  }

  static bool _validPast(Plurality plurality, GrammaticalPerson person, VerbForm form) {
    bool res;
    if (form != VerbForm.past) {
      res = false;
    }
    switch (person) {
      case GrammaticalPerson.first:
        res = _simplePlurality.contains(plurality);
      case GrammaticalPerson.second:
        res = _extendedPlurality.contains(plurality);
      case GrammaticalPerson.third:
        res = _pastTenseThirdPersonPlurality.contains(plurality);
      case GrammaticalPerson.none:
        res = false;
    }
    return res;
  }

  static bool _validFuture(Plurality plurality, GrammaticalPerson person, VerbForm form) {
    bool res;
    if (form != VerbForm.future) {
      res = false;
    }
    switch (person) {
      case GrammaticalPerson.first:
        res = _simplePlurality.contains(plurality);
      case GrammaticalPerson.second:
      case GrammaticalPerson.third:
        res = _extendedPlurality.contains(plurality);
      case GrammaticalPerson.none:
        res = false;
    }
    return res;
  }

  static bool _validPresentOrImperative(Plurality plurality, GrammaticalPerson person, VerbForm form) {
    return _presentAndImperative.contains(form) &&
        person == GrammaticalPerson.none &&
        _extendedPlurality.contains(plurality);
  }

  static bool _validInfinitive(Plurality plurality, GrammaticalPerson person, VerbForm form) {
    return form == VerbForm.infinitive && plurality == Plurality.none && person == GrammaticalPerson.none;
  }

  static final List<VerbForm> _presentAndImperative = [
    VerbForm.present,
    VerbForm.imperative,
  ];

  static final List<Plurality> _simplePlurality = [
    Plurality.singular,
    Plurality.plural,
  ];

  static final List<Plurality> _extendedPlurality = [
    Plurality.singularFem,
    Plurality.singularMasc,
    Plurality.pluralFem,
    Plurality.pluralMasc
  ];

  static final List<Plurality> _pastTenseThirdPersonPlurality = [
    Plurality.singularMasc,
    Plurality.singularFem,
    Plurality.plural
  ];
}

enum GrammaticalPerson {
  first,
  second,
  third,
  none;

  static GrammaticalPerson get(String str) {
    return GrammaticalPerson.values.firstWhere(
      (person) => person.name == str,
      orElse: () => GrammaticalPerson.none,
    );
  }
}

enum Plurality {
  singular,
  plural,
  singularMasc,
  pluralMasc,
  singularFem,
  pluralFem,
  none;

  static Plurality get(String str) {
    return Plurality.values.firstWhere(
      (plr) => plr.name == str,
      orElse: () => Plurality.none,
    );
  }
}

enum VerbForm {
  present,
  past,
  future,
  imperative,
  infinitive;

  static VerbForm get(String str) {
    return VerbForm.values.firstWhere(
      (form) => form.name == str,
      orElse: () => VerbForm.infinitive,
    );
  }
}
