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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Personalize Your Experience`
  String get personalize_experience {
    return Intl.message(
      'Personalize Your Experience',
      name: 'personalize_experience',
      desc: '',
      args: [],
    );
  }

  /// `Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.`
  String get choose_theme_language {
    return Intl.message(
      'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
      name: 'choose_theme_language',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `Find Events That Inspire You`
  String get find_events_title {
    return Intl.message(
      'Find Events That Inspire You',
      name: 'find_events_title',
      desc: '',
      args: [],
    );
  }

  /// `Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.`
  String get find_events_desc {
    return Intl.message(
      'Dive into a world of events crafted to fit your unique interests. Whether you\'re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.',
      name: 'find_events_desc',
      desc: '',
      args: [],
    );
  }

  /// `Effortless Event Planning`
  String get effortless_planning {
    return Intl.message(
      'Effortless Event Planning',
      name: 'effortless_planning',
      desc: '',
      args: [],
    );
  }

  /// `Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.`
  String get effortless_planning_desc {
    return Intl.message(
      'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.',
      name: 'effortless_planning_desc',
      desc: '',
      args: [],
    );
  }

  /// `Connect with Friends & Share Moments`
  String get connect_share {
    return Intl.message(
      'Connect with Friends & Share Moments',
      name: 'connect_share',
      desc: '',
      args: [],
    );
  }

  /// `Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.`
  String get connect_share_desc {
    return Intl.message(
      'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.',
      name: 'connect_share_desc',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Forget Password`
  String get forget_password {
    return Intl.message(
      'Forget Password',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Don’t Have Account?`
  String get dont_have_account {
    return Intl.message(
      'Don’t Have Account?',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message('Or', name: 'or', desc: '', args: []);
  }

  /// `Login With Google`
  String get login_google {
    return Intl.message(
      'Login With Google',
      name: 'login_google',
      desc: '',
      args: [],
    );
  }

  /// `Re Password`
  String get re_password {
    return Intl.message('Re Password', name: 're_password', desc: '', args: []);
  }

  /// `Already Have Account?`
  String get already_have_account {
    return Intl.message(
      'Already Have Account?',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcome_back {
    return Intl.message(
      'Welcome Back',
      name: 'welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Sport`
  String get sport {
    return Intl.message('Sport', name: 'sport', desc: '', args: []);
  }

  /// `Birthday`
  String get birthday {
    return Intl.message('Birthday', name: 'birthday', desc: '', args: []);
  }

  /// `Meeting`
  String get meeting {
    return Intl.message('Meeting', name: 'meeting', desc: '', args: []);
  }

  /// `Gaming`
  String get gaming {
    return Intl.message('Gaming', name: 'gaming', desc: '', args: []);
  }

  /// `Eating`
  String get eating {
    return Intl.message('Eating', name: 'eating', desc: '', args: []);
  }

  /// `Holiday`
  String get holiday {
    return Intl.message('Holiday', name: 'holiday', desc: '', args: []);
  }

  /// `Exhibition`
  String get exhibition {
    return Intl.message('Exhibition', name: 'exhibition', desc: '', args: []);
  }

  /// `Workshop`
  String get workshop {
    return Intl.message('Workshop', name: 'workshop', desc: '', args: []);
  }

  /// `Book Club`
  String get bookclub {
    return Intl.message('Book Club', name: 'bookclub', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Map`
  String get map {
    return Intl.message('Map', name: 'map', desc: '', args: []);
  }

  /// `Love`
  String get love {
    return Intl.message('Love', name: 'love', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Search for Event`
  String get search_event {
    return Intl.message(
      'Search for Event',
      name: 'search_event',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Create Event`
  String get create_event {
    return Intl.message(
      'Create Event',
      name: 'create_event',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message('Title', name: 'title', desc: '', args: []);
  }

  /// `Event Title`
  String get event_title {
    return Intl.message('Event Title', name: 'event_title', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Event Description`
  String get event_description {
    return Intl.message(
      'Event Description',
      name: 'event_description',
      desc: '',
      args: [],
    );
  }

  /// `Event Date`
  String get event_date {
    return Intl.message('Event Date', name: 'event_date', desc: '', args: []);
  }

  /// `Event Time`
  String get event_time {
    return Intl.message('Event Time', name: 'event_time', desc: '', args: []);
  }

  /// `Choose Date`
  String get choose_date {
    return Intl.message('Choose Date', name: 'choose_date', desc: '', args: []);
  }

  /// `Choose Time`
  String get choose_time {
    return Intl.message('Choose Time', name: 'choose_time', desc: '', args: []);
  }

  /// `Choose Event Location`
  String get choose_location {
    return Intl.message(
      'Choose Event Location',
      name: 'choose_location',
      desc: '',
      args: [],
    );
  }

  /// `Add Event`
  String get add_event {
    return Intl.message('Add Event', name: 'add_event', desc: '', args: []);
  }

  /// `Location`
  String get location {
    return Intl.message('Location', name: 'location', desc: '', args: []);
  }

  /// `Tap on Location To Select`
  String get tap_location {
    return Intl.message(
      'Tap on Location To Select',
      name: 'tap_location',
      desc: '',
      args: [],
    );
  }

  /// `Event Details`
  String get event_details {
    return Intl.message(
      'Event Details',
      name: 'event_details',
      desc: '',
      args: [],
    );
  }

  /// `Edit Event`
  String get edit_event {
    return Intl.message('Edit Event', name: 'edit_event', desc: '', args: []);
  }

  /// `Update Event`
  String get update_event {
    return Intl.message(
      'Update Event',
      name: 'update_event',
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
