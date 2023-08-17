// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hot`
  String get tab_title_hot {
    return Intl.message(
      'Hot',
      name: 'tab_title_hot',
      desc: '',
      args: [],
    );
  }

  /// `Analytics`
  String get tab_title_analytics {
    return Intl.message(
      'Analytics',
      name: 'tab_title_analytics',
      desc: '',
      args: [],
    );
  }

  /// `Past Results`
  String get tab_title_past_results {
    return Intl.message(
      'Past Results',
      name: 'tab_title_past_results',
      desc: '',
      args: [],
    );
  }

  /// `My History`
  String get tab_title_my_history {
    return Intl.message(
      'My History',
      name: 'tab_title_my_history',
      desc: '',
      args: [],
    );
  }

  /// `Hot Numbers`
  String get hot_numbers {
    return Intl.message(
      'Hot Numbers',
      name: 'hot_numbers',
      desc: '',
      args: [],
    );
  }

  /// `Hot Numbers (Pau)`
  String get hot_numbers_pau {
    return Intl.message(
      'Hot Numbers (Pau)',
      name: 'hot_numbers_pau',
      desc: '',
      args: [],
    );
  }

  /// `Hot Doubles`
  String get hot_doubles {
    return Intl.message(
      'Hot Doubles',
      name: 'hot_doubles',
      desc: '',
      args: [],
    );
  }

  /// `Double`
  String get double {
    return Intl.message(
      'Double',
      name: 'double',
      desc: '',
      args: [],
    );
  }

  /// `Hot Triples`
  String get hot_triples {
    return Intl.message(
      'Hot Triples',
      name: 'hot_triples',
      desc: '',
      args: [],
    );
  }

  /// `Triple`
  String get triple {
    return Intl.message(
      'Triple',
      name: 'triple',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
