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

  /// `Welcome Back ✨`
  String get welcome_back {
    return Intl.message(
      'Welcome Back ✨',
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

  /// `Forget Password?`
  String get Forget_Password_question {
    return Intl.message(
      'Forget Password?',
      name: 'Forget_Password_question',
      desc: '',
      args: [],
    );
  }

  /// `Login With Facebook`
  String get login_with_facebook {
    return Intl.message(
      'Login With Facebook',
      name: 'login_with_facebook',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `The password provided is too weak.`
  String get weak_password {
    return Intl.message(
      'The password provided is too weak.',
      name: 'weak_password',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email.`
  String get email_already_in_use {
    return Intl.message(
      'The account already exists for that email.',
      name: 'email_already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `No user found for that email.`
  String get user_not_found {
    return Intl.message(
      'No user found for that email.',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password provided for that user.`
  String get wrong_password {
    return Intl.message(
      'Wrong password provided for that user.',
      name: 'wrong_password',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password.`
  String get invalid_credentials {
    return Intl.message(
      'Invalid email or password.',
      name: 'invalid_credentials',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred, please try again later.`
  String get unexpected_error {
    return Intl.message(
      'An unexpected error occurred, please try again later.',
      name: 'unexpected_error',
      desc: '',
      args: [],
    );
  }

  /// `field is required`
  String get Field_is_required {
    return Intl.message(
      'field is required',
      name: 'Field_is_required',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match.`
  String get passwords_do_not_match {
    return Intl.message(
      'Passwords do not match.',
      name: 'passwords_do_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Oops`
  String get oops {
    return Intl.message('Oops', name: 'oops', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Warning`
  String get warning {
    return Intl.message('Warning', name: 'warning', desc: '', args: []);
  }

  /// `Successfully`
  String get success {
    return Intl.message('Successfully', name: 'success', desc: '', args: []);
  }

  /// `loading`
  String get loading {
    return Intl.message('loading', name: 'loading', desc: '', args: []);
  }

  /// `Account created successfully!`
  String get registration_success {
    return Intl.message(
      'Account created successfully!',
      name: 'registration_success',
      desc: '',
      args: [],
    );
  }

  /// `You have signed in successfully.`
  String get signInSuccess {
    return Intl.message(
      'You have signed in successfully.',
      name: 'signInSuccess',
      desc: '',
      args: [],
    );
  }

  /// `The operation was interrupted due to a conflict. Please try again.`
  String get ABORTED {
    return Intl.message(
      'The operation was interrupted due to a conflict. Please try again.',
      name: 'ABORTED',
      desc: '',
      args: [],
    );
  }

  /// `This item already exists.`
  String get ALREADY_EXISTS {
    return Intl.message(
      'This item already exists.',
      name: 'ALREADY_EXISTS',
      desc: '',
      args: [],
    );
  }

  /// `The operation was cancelled.`
  String get CANCELLED {
    return Intl.message(
      'The operation was cancelled.',
      name: 'CANCELLED',
      desc: '',
      args: [],
    );
  }

  /// `A serious error occurred. Some data may be lost.`
  String get DATA_LOSS {
    return Intl.message(
      'A serious error occurred. Some data may be lost.',
      name: 'DATA_LOSS',
      desc: '',
      args: [],
    );
  }

  /// `The operation took too long to complete. Please try again.`
  String get DEADLINE_EXCEEDED {
    return Intl.message(
      'The operation took too long to complete. Please try again.',
      name: 'DEADLINE_EXCEEDED',
      desc: '',
      args: [],
    );
  }

  /// `The system is not ready to perform this action.`
  String get FAILED_PRECONDITION {
    return Intl.message(
      'The system is not ready to perform this action.',
      name: 'FAILED_PRECONDITION',
      desc: '',
      args: [],
    );
  }

  /// `An internal error occurred. Please try again later.`
  String get INTERNAL {
    return Intl.message(
      'An internal error occurred. Please try again later.',
      name: 'INTERNAL',
      desc: '',
      args: [],
    );
  }

  /// `Invalid input provided. Please check your data.`
  String get INVALID_ARGUMENT {
    return Intl.message(
      'Invalid input provided. Please check your data.',
      name: 'INVALID_ARGUMENT',
      desc: '',
      args: [],
    );
  }

  /// `The requested item was not found.`
  String get NOT_FOUND {
    return Intl.message(
      'The requested item was not found.',
      name: 'NOT_FOUND',
      desc: '',
      args: [],
    );
  }

  /// `Operation completed successfully.`
  String get OK {
    return Intl.message(
      'Operation completed successfully.',
      name: 'OK',
      desc: '',
      args: [],
    );
  }

  /// `The request was out of valid range.`
  String get OUT_OF_RANGE {
    return Intl.message(
      'The request was out of valid range.',
      name: 'OUT_OF_RANGE',
      desc: '',
      args: [],
    );
  }

  /// `You do not have permission to do this.`
  String get PERMISSION_DENIED {
    return Intl.message(
      'You do not have permission to do this.',
      name: 'PERMISSION_DENIED',
      desc: '',
      args: [],
    );
  }

  /// `Resource limit reached. Try again later.`
  String get RESOURCE_EXHAUSTED {
    return Intl.message(
      'Resource limit reached. Try again later.',
      name: 'RESOURCE_EXHAUSTED',
      desc: '',
      args: [],
    );
  }

  /// `You must be logged in to perform this action.`
  String get UNAUTHENTICATED {
    return Intl.message(
      'You must be logged in to perform this action.',
      name: 'UNAUTHENTICATED',
      desc: '',
      args: [],
    );
  }

  /// `Service is currently unavailable. Please try again later.`
  String get UNAVAILABLE {
    return Intl.message(
      'Service is currently unavailable. Please try again later.',
      name: 'UNAVAILABLE',
      desc: '',
      args: [],
    );
  }

  /// `This feature is not available yet.`
  String get UNIMPLEMENTED {
    return Intl.message(
      'This feature is not available yet.',
      name: 'UNIMPLEMENTED',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred. Please try again.`
  String get UNKNOWN {
    return Intl.message(
      'An unknown error occurred. Please try again.',
      name: 'UNKNOWN',
      desc: '',
      args: [],
    );
  }

  /// `An account already exists with the same email address but using a different sign-in method. Please use the correct provider (e.g., Google, Facebook, or email) to log in.`
  String get accountExistsWithDifferentCredential {
    return Intl.message(
      'An account already exists with the same email address but using a different sign-in method. Please use the correct provider (e.g., Google, Facebook, or email) to log in.',
      name: 'accountExistsWithDifferentCredential',
      desc: '',
      args: [],
    );
  }

  /// `mohamed mousa`
  String get mohamed_mousa {
    return Intl.message(
      'mohamed mousa',
      name: 'mohamed_mousa',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection , please check your network`
  String get no_internet_connection_failure {
    return Intl.message(
      'No internet connection , please check your network',
      name: 'no_internet_connection_failure',
      desc: '',
      args: [],
    );
  }

  /// `you must choose date for the event`
  String get choose_date_required {
    return Intl.message(
      'you must choose date for the event',
      name: 'choose_date_required',
      desc: '',
      args: [],
    );
  }

  /// `you must choose time for the event`
  String get choose_time_required {
    return Intl.message(
      'you must choose time for the event',
      name: 'choose_time_required',
      desc: '',
      args: [],
    );
  }

  /// `you must choose date and time for the event`
  String get date_time_require {
    return Intl.message(
      'you must choose date and time for the event',
      name: 'date_time_require',
      desc: '',
      args: [],
    );
  }

  /// `Location permission denied.`
  String get location_permission_denied {
    return Intl.message(
      'Location permission denied.',
      name: 'location_permission_denied',
      desc: '',
      args: [],
    );
  }

  /// `Please press the button again and allow location access.`
  String get location_permission_instruction {
    return Intl.message(
      'Please press the button again and allow location access.',
      name: 'location_permission_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Location services denied you should open it Manually from settings`
  String get Location_services_denied_instruction {
    return Intl.message(
      'Location services denied you should open it Manually from settings',
      name: 'Location_services_denied_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Search for your event Location`
  String get Search_for_your_event_Location {
    return Intl.message(
      'Search for your event Location',
      name: 'Search_for_your_event_Location',
      desc: '',
      args: [],
    );
  }

  /// `Could not find any result for the supplied address`
  String get no_address_found {
    return Intl.message(
      'Could not find any result for the supplied address',
      name: 'no_address_found',
      desc: '',
      args: [],
    );
  }

  /// `Press here after tap your location`
  String get Press_here_after_tap_your_location {
    return Intl.message(
      'Press here after tap your location',
      name: 'Press_here_after_tap_your_location',
      desc: '',
      args: [],
    );
  }

  /// `you should tap your event location`
  String get you_should_tap_your_event_location {
    return Intl.message(
      'you should tap your event location',
      name: 'you_should_tap_your_event_location',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'location_service _denied_message' key

  /// `location permission is denied , please open app settings to allow location permission`
  String get location_permission_message {
    return Intl.message(
      'location permission is denied , please open app settings to allow location permission',
      name: 'location_permission_message',
      desc: '',
      args: [],
    );
  }

  /// `Event location required`
  String get event_location_requird {
    return Intl.message(
      'Event location required',
      name: 'event_location_requird',
      desc: '',
      args: [],
    );
  }

  /// `Event created successfully`
  String get event_created_successfully {
    return Intl.message(
      'Event created successfully',
      name: 'event_created_successfully',
      desc: '',
      args: [],
    );
  }

  /// ` Name not available`
  String get name_not_available {
    return Intl.message(
      ' Name not available',
      name: 'name_not_available',
      desc: '',
      args: [],
    );
  }

  /// `No events added yet`
  String get No_events_added_yet {
    return Intl.message(
      'No events added yet',
      name: 'No_events_added_yet',
      desc: '',
      args: [],
    );
  }

  /// ` Event added to favorites successfully`
  String get Event_added_to_favorites_successfully {
    return Intl.message(
      ' Event added to favorites successfully',
      name: 'Event_added_to_favorites_successfully',
      desc: '',
      args: [],
    );
  }

  /// ` Event removed from favourites successfully`
  String get event_removed_from_Favorite {
    return Intl.message(
      ' Event removed from favourites successfully',
      name: 'event_removed_from_Favorite',
      desc: '',
      args: [],
    );
  }

  /// `Event Updated successfully`
  String get Event_Updated_successfully {
    return Intl.message(
      'Event Updated successfully',
      name: 'Event_Updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Sign out successfully`
  String get sign_out_successfully {
    return Intl.message(
      'Sign out successfully',
      name: 'sign_out_successfully',
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
