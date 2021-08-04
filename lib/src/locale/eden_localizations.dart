import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EdenLocalizations {
  final Locale locale;
  EdenLocalizations(this.locale);
  Map<String, EdenString> values = {
    'en': EnEdenString(),
    'zh': ChEdenString(),
  };

  EdenString? get currentLocalization {
    if (values.containsKey(locale.languageCode)) {
      return values[locale.languageCode];
    }
    return values["en"];
  }

  static const RefreshLocalizationsDelegate delegate =
      RefreshLocalizationsDelegate();
  static EdenLocalizations? of(BuildContext context) {
    return Localizations.of(context, EdenLocalizations);
  }
}

class RefreshLocalizationsDelegate
    extends LocalizationsDelegate<EdenLocalizations> {
  const RefreshLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return [
      'en',
      'zh',
    ].contains(locale.languageCode);
  }

  @override
  Future<EdenLocalizations> load(Locale locale) {
    return SynchronousFuture<EdenLocalizations>(EdenLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<EdenLocalizations> old) {
    return false;
  }
}

/// interface implements different language
abstract class EdenString {
  String? loadingText;
}

class EnEdenString implements EdenString {
  @override
  String? loadingText = "loading...";
}

class ChEdenString implements EdenString {
  @override
  String? loadingText = "加载中...";
}
