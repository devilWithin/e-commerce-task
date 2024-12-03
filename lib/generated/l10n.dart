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

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Product Images`
  String get productImages {
    return Intl.message(
      'Product Images',
      name: 'productImages',
      desc: '',
      args: [],
    );
  }

  /// `Main Image`
  String get mainImage {
    return Intl.message(
      'Main Image',
      name: 'mainImage',
      desc: '',
      args: [],
    );
  }

  /// `Image must not be more than 2.5 MB`
  String get imageMustNotBeMoreThan {
    return Intl.message(
      'Image must not be more than 2.5 MB',
      name: 'imageMustNotBeMoreThan',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get fieldIsRequired {
    return Intl.message(
      'This field is required',
      name: 'fieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Product Name`
  String get productName {
    return Intl.message(
      'Product Name',
      name: 'productName',
      desc: '',
      args: [],
    );
  }

  /// `Main Category`
  String get mainCategory {
    return Intl.message(
      'Main Category',
      name: 'mainCategory',
      desc: '',
      args: [],
    );
  }

  /// `Secondary Category`
  String get secondaryCategory {
    return Intl.message(
      'Secondary Category',
      name: 'secondaryCategory',
      desc: '',
      args: [],
    );
  }

  /// `RSA`
  String get rsa {
    return Intl.message(
      'RSA',
      name: 'rsa',
      desc: '',
      args: [],
    );
  }

  /// `Product Price`
  String get productPrice {
    return Intl.message(
      'Product Price',
      name: 'productPrice',
      desc: '',
      args: [],
    );
  }

  /// `Addons`
  String get addons {
    return Intl.message(
      'Addons',
      name: 'addons',
      desc: '',
      args: [],
    );
  }

  /// `Specify Color`
  String get specifyColor {
    return Intl.message(
      'Specify Color',
      name: 'specifyColor',
      desc: '',
      args: [],
    );
  }

  /// `Specify Size`
  String get specifySize {
    return Intl.message(
      'Specify Size',
      name: 'specifySize',
      desc: '',
      args: [],
    );
  }

  /// `Product Status`
  String get productStatus {
    return Intl.message(
      'Product Status',
      name: 'productStatus',
      desc: '',
      args: [],
    );
  }

  /// `New Product`
  String get newProduct {
    return Intl.message(
      'New Product',
      name: 'newProduct',
      desc: '',
      args: [],
    );
  }

  /// `Used Product`
  String get usedProduct {
    return Intl.message(
      'Used Product',
      name: 'usedProduct',
      desc: '',
      args: [],
    );
  }

  /// `Products List`
  String get productsList {
    return Intl.message(
      'Products List',
      name: 'productsList',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Activate Product`
  String get activateProduct {
    return Intl.message(
      'Activate Product',
      name: 'activateProduct',
      desc: '',
      args: [],
    );
  }

  /// `Add Product`
  String get addProduct {
    return Intl.message(
      'Add Product',
      name: 'addProduct',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Edit Product`
  String get editProduct {
    return Intl.message(
      'Edit Product',
      name: 'editProduct',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
