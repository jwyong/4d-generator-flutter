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

  /// `Last 1 year`
  String get last_year_1 {
    return Intl.message(
      'Last 1 year',
      name: 'last_year_1',
      desc: '',
      args: [],
    );
  }

  /// `Last 2 years`
  String get last_year_2 {
    return Intl.message(
      'Last 2 years',
      name: 'last_year_2',
      desc: '',
      args: [],
    );
  }

  /// `Last 3 years`
  String get last_year_3 {
    return Intl.message(
      'Last 3 years',
      name: 'last_year_3',
      desc: '',
      args: [],
    );
  }

  /// `Last 5 years`
  String get last_year_5 {
    return Intl.message(
      'Last 5 years',
      name: 'last_year_5',
      desc: '',
      args: [],
    );
  }

  /// `Last 10 years`
  String get last_year_10 {
    return Intl.message(
      'Last 10 years',
      name: 'last_year_10',
      desc: '',
      args: [],
    );
  }

  /// `Last 15 years`
  String get last_year_15 {
    return Intl.message(
      'Last 15 years',
      name: 'last_year_15',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Powered by wtf.ai.`
  String get generate_number_title {
    return Intl.message(
      'Powered by wtf.ai.',
      name: 'generate_number_title',
      desc: '',
      args: [],
    );
  }

  /// `Generate`
  String get generate {
    return Intl.message(
      'Generate',
      name: 'generate',
      desc: '',
      args: [],
    );
  }

  /// `Start generating now!`
  String get generate_start_text {
    return Intl.message(
      'Start generating now!',
      name: 'generate_start_text',
      desc: '',
      args: [],
    );
  }

  /// `Your lucky number is:`
  String get generate_end_text {
    return Intl.message(
      'Your lucky number is:',
      name: 'generate_end_text',
      desc: '',
      args: [],
    );
  }

  /// `Generating now!`
  String get generating_text_1 {
    return Intl.message(
      'Generating now!',
      name: 'generating_text_1',
      desc: '',
      args: [],
    );
  }

  /// `AI is calculating`
  String get generating_text_2 {
    return Intl.message(
      'AI is calculating',
      name: 'generating_text_2',
      desc: '',
      args: [],
    );
  }

  /// `Almost there`
  String get generating_text_3 {
    return Intl.message(
      'Almost there',
      name: 'generating_text_3',
      desc: '',
      args: [],
    );
  }

  /// `Deep diving into the unknown...`
  String get generating_text_4 {
    return Intl.message(
      'Deep diving into the unknown...',
      name: 'generating_text_4',
      desc: '',
      args: [],
    );
  }

  /// `Running meticulous algorithm...`
  String get generating_text_5 {
    return Intl.message(
      'Running meticulous algorithm...',
      name: 'generating_text_5',
      desc: '',
      args: [],
    );
  }

  /// `Number`
  String get number {
    return Intl.message(
      'Number',
      name: 'number',
      desc: '',
      args: [],
    );
  }

  /// `Generated`
  String get generated {
    return Intl.message(
      'Generated',
      name: 'generated',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Draw no`
  String get draw_no {
    return Intl.message(
      'Draw no',
      name: 'draw_no',
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
