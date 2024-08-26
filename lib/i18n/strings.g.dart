/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 172 (86 per locale)
///
/// Built on 2024-08-15 at 15:10 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	ru(languageCode: 'ru', build: _StringsRu.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	List<String> get onboarding => [
		'Player information',
		'Add detailed player information',
		'Next',
	];
	late final _StringsTeamEn team = _StringsTeamEn._(_root);
	late final _StringsWorkoutEn workout = _StringsWorkoutEn._(_root);
	late final _StringsStrategiesEn strategies = _StringsStrategiesEn._(_root);
	late final _StringsMatchesEn matches = _StringsMatchesEn._(_root);
	late final _StringsSettingsEn settings = _StringsSettingsEn._(_root);
}

// Path: team
class _StringsTeamEn {
	_StringsTeamEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get appbar => 'Team';
	List<String> get empty_screen => [
		'Empty',
		'You don\'t have any team\nadded yet',
	];
	List<String> get new_player_mbs => [
		'New Player',
		'Name Player',
		'Player Position',
		'Age',
		'Salary',
		'Description',
		'Add',
	];
	List<String> get player_mbs => [
		'Age',
		'Salary',
		'Edit',
		'Delete',
	];
	List<String> get player_edit_mbs => [
		'Editing',
		'Name Player',
		'Player Position',
		'Age',
		'Salary',
		'Description',
		'Save',
	];
	List<String> get player_delete_confirmation => [
		'Deletion confirmation',
		'Player data will be permanently deleted',
		'Cancel',
		'Delete',
	];
}

// Path: workout
class _StringsWorkoutEn {
	_StringsWorkoutEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get appbar => 'Workout';
	late final _StringsWorkoutTimeEn time = _StringsWorkoutTimeEn._(_root);
	List<String> get empty_screen => [
		'Empty',
		'You don\'t have any workouts\nadded yet',
	];
	List<String> get new_workout_mbs => [
		'New Workout',
		'Training Time',
		'Title',
		'Description',
		'Add',
	];
	List<String> get edit => [
		'Editing',
		'Training Time',
		'Title',
		'Description',
		'Save',
	];
	List<String> get delete => [
		'Deletion confirmation',
		'Workout will be permanently deleted',
		'Cancel',
		'Delete',
	];
}

// Path: strategies
class _StringsStrategiesEn {
	_StringsStrategiesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get appbar => 'Strategies';
	List<String> get empty_screen => [
		'Empty',
		'You don\'t have any strategies\nadded yet',
	];
	List<String> get new_strategy_mbs => [
		'New Strategy',
		'Title',
		'Abbreviation',
		'Text',
		'Add',
	];
	List<String> get edit => [
		'Editing',
		'Title',
		'Abbreviation',
		'Text',
		'Save',
	];
	List<String> get delete => [
		'Deletion confirmation',
		'Strategy will be permanently deleted',
		'Cancel',
		'Delete',
	];
}

// Path: matches
class _StringsMatchesEn {
	_StringsMatchesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get appbar => 'Matches';
	List<String> get currency => [
		'Winning currency',
		'EUR/USD',
	];
	List<String> get empty_screen => [
		'Empty',
		'You don\'t have any matches\nadded yet',
	];
	List<dynamic> get new_match_mbs => [
		'New Match',
		_StringsMatches$newMatchMbs$0i1$En._(_root),
		'Game Score',
		'Winning Amount',
		'Add',
	];
	List<String> get delete => [
		'Deletion confirmation',
		'Match will be permanently deleted',
		'Cancel',
		'Delete',
	];
}

// Path: settings
class _StringsSettingsEn {
	_StringsSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get appbar => 'Settings';
	List<String> get items => [
		'Usage Policy',
		'Share App',
		'Rate Us',
	];
}

// Path: workout.time
class _StringsWorkoutTimeEn {
	_StringsWorkoutTimeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get start => 'Start of training';
	String get end => 'End of training';
	List<String> get time_picker => [
		'Training Time',
		'Save',
	];
	String get minutes => ' minutes';
}

// Path: matches.new_match_mbs.1
class _StringsMatches$newMatchMbs$0i1$En {
	_StringsMatches$newMatchMbs$0i1$En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	List<String> get date => [
		'Match date',
		'Save',
	];
}

// Path: <root>
class _StringsRu implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsRu.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsRu _root = this; // ignore: unused_field

	// Translations
	@override List<String> get onboarding => [
		'Информация игрока',
		'Добавьте информацию об игроке',
		'Дальше',
	];
	@override late final _StringsTeamRu team = _StringsTeamRu._(_root);
	@override late final _StringsWorkoutRu workout = _StringsWorkoutRu._(_root);
	@override late final _StringsStrategiesRu strategies = _StringsStrategiesRu._(_root);
	@override late final _StringsMatchesRu matches = _StringsMatchesRu._(_root);
	@override late final _StringsSettingsRu settings = _StringsSettingsRu._(_root);
}

// Path: team
class _StringsTeamRu implements _StringsTeamEn {
	_StringsTeamRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get appbar => 'Команда';
	@override List<String> get empty_screen => [
		'Пусто',
		'У вас еще не добавлено\nни одной команды',
	];
	@override List<String> get new_player_mbs => [
		'Новый игрок',
		'Имя игрока',
		'Позиция игрока',
		'Возраст',
		'Заработная плата',
		'Описание',
		'Добавить',
	];
	@override List<String> get player_mbs => [
		'Возраст',
		'Заработная плата',
		'Редактировать',
		'Удалить',
	];
	@override List<String> get player_edit_mbs => [
		'Редактирование',
		'Имя игрока',
		'Позиция игрока',
		'Возраст',
		'Заработная плата',
		'Описание',
		'Сохранить',
	];
	@override List<String> get player_delete_confirmation => [
		'Подтверждение удаления',
		'Данные игрока будут удалены без возможности восстановления',
		'Отменить',
		'Удалить',
	];
}

// Path: workout
class _StringsWorkoutRu implements _StringsWorkoutEn {
	_StringsWorkoutRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get appbar => 'Тренировка';
	@override late final _StringsWorkoutTimeRu time = _StringsWorkoutTimeRu._(_root);
	@override List<String> get empty_screen => [
		'Пусто',
		'У вас еще не добавлено\nни одной тренировки',
	];
	@override List<String> get new_workout_mbs => [
		'Новая тренировка',
		'Время тренировки',
		'Заголовок',
		'Описание',
		'Сохранить',
	];
	@override List<String> get edit => [
		'Редактирование',
		'Время тренировки',
		'Заголовок',
		'Описание',
		'Сохранить',
	];
	@override List<String> get delete => [
		'Подтверждение удаления',
		'Данные тренировки будут удалены без возможности восстановления',
		'Отменить',
		'Удалить',
	];
}

// Path: strategies
class _StringsStrategiesRu implements _StringsStrategiesEn {
	_StringsStrategiesRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get appbar => 'Стратегии';
	@override List<String> get empty_screen => [
		'Пусто',
		'У вас еще не добавлено\nни одной стратегии',
	];
	@override List<String> get new_strategy_mbs => [
		'Новая стратегия',
		'Заголовок',
		'Аббревиатура',
		'Текст',
		'Сохранить',
	];
	@override List<String> get edit => [
		'Редактирование',
		'Заголовок',
		'Аббревиатура',
		'Текст',
		'Сохранить',
	];
	@override List<String> get delete => [
		'Подтверждение удаления',
		'Данные стратегии будут удалены без возможности восстановления',
		'Отменить',
		'Удалить',
	];
}

// Path: matches
class _StringsMatchesRu implements _StringsMatchesEn {
	_StringsMatchesRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get appbar => 'Матчи';
	@override List<String> get currency => [
		'Выигрышная валюта',
		'ЕВРО/ДОЛЛАР',
	];
	@override List<String> get empty_screen => [
		'Пусто',
		'У вас еще не добавлено\nни одного матча',
	];
	@override List<dynamic> get new_match_mbs => [
		'Новый матч',
		_StringsMatches$newMatchMbs$0i1$Ru._(_root),
		'Счёт игры',
		'Сумма выигрыша',
		'Добавить',
	];
	@override List<String> get delete => [
		'Подтверждение удаления',
		'Данные матча будут удалены без возможности восстановления',
		'Отменить',
		'Удалить',
	];
}

// Path: settings
class _StringsSettingsRu implements _StringsSettingsEn {
	_StringsSettingsRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get appbar => 'Настройки';
	@override List<String> get items => [
		'Политика использования',
		'Поделиться приложением',
		'Оцените нас',
	];
}

// Path: workout.time
class _StringsWorkoutTimeRu implements _StringsWorkoutTimeEn {
	_StringsWorkoutTimeRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get start => 'Начало тренировки';
	@override String get end => 'Конец тренировки';
	@override List<String> get time_picker => [
		'Время тренировки',
		'Сохранить',
	];
	@override String get minutes => ' минут';
}

// Path: matches.new_match_mbs.1
class _StringsMatches$newMatchMbs$0i1$Ru implements _StringsMatches$newMatchMbs$0i1$En {
	_StringsMatches$newMatchMbs$0i1$Ru._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override List<String> get date => [
		'Дата матча',
		'Сохранить',
	];
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'onboarding.0': return 'Player information';
			case 'onboarding.1': return 'Add detailed player information';
			case 'onboarding.2': return 'Next';
			case 'team.appbar': return 'Team';
			case 'team.empty_screen.0': return 'Empty';
			case 'team.empty_screen.1': return 'You don\'t have any team\nadded yet';
			case 'team.new_player_mbs.0': return 'New Player';
			case 'team.new_player_mbs.1': return 'Name Player';
			case 'team.new_player_mbs.2': return 'Player Position';
			case 'team.new_player_mbs.3': return 'Age';
			case 'team.new_player_mbs.4': return 'Salary';
			case 'team.new_player_mbs.5': return 'Description';
			case 'team.new_player_mbs.6': return 'Add';
			case 'team.player_mbs.0': return 'Age';
			case 'team.player_mbs.1': return 'Salary';
			case 'team.player_mbs.2': return 'Edit';
			case 'team.player_mbs.3': return 'Delete';
			case 'team.player_edit_mbs.0': return 'Editing';
			case 'team.player_edit_mbs.1': return 'Name Player';
			case 'team.player_edit_mbs.2': return 'Player Position';
			case 'team.player_edit_mbs.3': return 'Age';
			case 'team.player_edit_mbs.4': return 'Salary';
			case 'team.player_edit_mbs.5': return 'Description';
			case 'team.player_edit_mbs.6': return 'Save';
			case 'team.player_delete_confirmation.0': return 'Deletion confirmation';
			case 'team.player_delete_confirmation.1': return 'Player data will be permanently deleted';
			case 'team.player_delete_confirmation.2': return 'Cancel';
			case 'team.player_delete_confirmation.3': return 'Delete';
			case 'workout.appbar': return 'Workout';
			case 'workout.time.start': return 'Start of training';
			case 'workout.time.end': return 'End of training';
			case 'workout.time.time_picker.0': return 'Training Time';
			case 'workout.time.time_picker.1': return 'Save';
			case 'workout.time.minutes': return ' minutes';
			case 'workout.empty_screen.0': return 'Empty';
			case 'workout.empty_screen.1': return 'You don\'t have any workouts\nadded yet';
			case 'workout.new_workout_mbs.0': return 'New Workout';
			case 'workout.new_workout_mbs.1': return 'Training Time';
			case 'workout.new_workout_mbs.2': return 'Title';
			case 'workout.new_workout_mbs.3': return 'Description';
			case 'workout.new_workout_mbs.4': return 'Add';
			case 'workout.edit.0': return 'Editing';
			case 'workout.edit.1': return 'Training Time';
			case 'workout.edit.2': return 'Title';
			case 'workout.edit.3': return 'Description';
			case 'workout.edit.4': return 'Save';
			case 'workout.delete.0': return 'Deletion confirmation';
			case 'workout.delete.1': return 'Workout will be permanently deleted';
			case 'workout.delete.2': return 'Cancel';
			case 'workout.delete.3': return 'Delete';
			case 'strategies.appbar': return 'Strategies';
			case 'strategies.empty_screen.0': return 'Empty';
			case 'strategies.empty_screen.1': return 'You don\'t have any strategies\nadded yet';
			case 'strategies.new_strategy_mbs.0': return 'New Strategy';
			case 'strategies.new_strategy_mbs.1': return 'Title';
			case 'strategies.new_strategy_mbs.2': return 'Abbreviation';
			case 'strategies.new_strategy_mbs.3': return 'Text';
			case 'strategies.new_strategy_mbs.4': return 'Add';
			case 'strategies.edit.0': return 'Editing';
			case 'strategies.edit.1': return 'Title';
			case 'strategies.edit.2': return 'Abbreviation';
			case 'strategies.edit.3': return 'Text';
			case 'strategies.edit.4': return 'Save';
			case 'strategies.delete.0': return 'Deletion confirmation';
			case 'strategies.delete.1': return 'Strategy will be permanently deleted';
			case 'strategies.delete.2': return 'Cancel';
			case 'strategies.delete.3': return 'Delete';
			case 'matches.appbar': return 'Matches';
			case 'matches.currency.0': return 'Winning currency';
			case 'matches.currency.1': return 'EUR/USD';
			case 'matches.empty_screen.0': return 'Empty';
			case 'matches.empty_screen.1': return 'You don\'t have any matches\nadded yet';
			case 'matches.new_match_mbs.0': return 'New Match';
			case 'matches.new_match_mbs.1.date.0': return 'Match date';
			case 'matches.new_match_mbs.1.date.1': return 'Save';
			case 'matches.new_match_mbs.2': return 'Game Score';
			case 'matches.new_match_mbs.3': return 'Winning Amount';
			case 'matches.new_match_mbs.4': return 'Add';
			case 'matches.delete.0': return 'Deletion confirmation';
			case 'matches.delete.1': return 'Match will be permanently deleted';
			case 'matches.delete.2': return 'Cancel';
			case 'matches.delete.3': return 'Delete';
			case 'settings.appbar': return 'Settings';
			case 'settings.items.0': return 'Usage Policy';
			case 'settings.items.1': return 'Share App';
			case 'settings.items.2': return 'Rate Us';
			default: return null;
		}
	}
}

extension on _StringsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'onboarding.0': return 'Информация игрока';
			case 'onboarding.1': return 'Добавьте информацию об игроке';
			case 'onboarding.2': return 'Дальше';
			case 'team.appbar': return 'Команда';
			case 'team.empty_screen.0': return 'Пусто';
			case 'team.empty_screen.1': return 'У вас еще не добавлено\nни одной команды';
			case 'team.new_player_mbs.0': return 'Новый игрок';
			case 'team.new_player_mbs.1': return 'Имя игрока';
			case 'team.new_player_mbs.2': return 'Позиция игрока';
			case 'team.new_player_mbs.3': return 'Возраст';
			case 'team.new_player_mbs.4': return 'Заработная плата';
			case 'team.new_player_mbs.5': return 'Описание';
			case 'team.new_player_mbs.6': return 'Добавить';
			case 'team.player_mbs.0': return 'Возраст';
			case 'team.player_mbs.1': return 'Заработная плата';
			case 'team.player_mbs.2': return 'Редактировать';
			case 'team.player_mbs.3': return 'Удалить';
			case 'team.player_edit_mbs.0': return 'Редактирование';
			case 'team.player_edit_mbs.1': return 'Имя игрока';
			case 'team.player_edit_mbs.2': return 'Позиция игрока';
			case 'team.player_edit_mbs.3': return 'Возраст';
			case 'team.player_edit_mbs.4': return 'Заработная плата';
			case 'team.player_edit_mbs.5': return 'Описание';
			case 'team.player_edit_mbs.6': return 'Сохранить';
			case 'team.player_delete_confirmation.0': return 'Подтверждение удаления';
			case 'team.player_delete_confirmation.1': return 'Данные игрока будут удалены без возможности восстановления';
			case 'team.player_delete_confirmation.2': return 'Отменить';
			case 'team.player_delete_confirmation.3': return 'Удалить';
			case 'workout.appbar': return 'Тренировка';
			case 'workout.time.start': return 'Начало тренировки';
			case 'workout.time.end': return 'Конец тренировки';
			case 'workout.time.time_picker.0': return 'Время тренировки';
			case 'workout.time.time_picker.1': return 'Сохранить';
			case 'workout.time.minutes': return ' минут';
			case 'workout.empty_screen.0': return 'Пусто';
			case 'workout.empty_screen.1': return 'У вас еще не добавлено\nни одной тренировки';
			case 'workout.new_workout_mbs.0': return 'Новая тренировка';
			case 'workout.new_workout_mbs.1': return 'Время тренировки';
			case 'workout.new_workout_mbs.2': return 'Заголовок';
			case 'workout.new_workout_mbs.3': return 'Описание';
			case 'workout.new_workout_mbs.4': return 'Сохранить';
			case 'workout.edit.0': return 'Редактирование';
			case 'workout.edit.1': return 'Время тренировки';
			case 'workout.edit.2': return 'Заголовок';
			case 'workout.edit.3': return 'Описание';
			case 'workout.edit.4': return 'Сохранить';
			case 'workout.delete.0': return 'Подтверждение удаления';
			case 'workout.delete.1': return 'Данные тренировки будут удалены без возможности восстановления';
			case 'workout.delete.2': return 'Отменить';
			case 'workout.delete.3': return 'Удалить';
			case 'strategies.appbar': return 'Стратегии';
			case 'strategies.empty_screen.0': return 'Пусто';
			case 'strategies.empty_screen.1': return 'У вас еще не добавлено\nни одной стратегии';
			case 'strategies.new_strategy_mbs.0': return 'Новая стратегия';
			case 'strategies.new_strategy_mbs.1': return 'Заголовок';
			case 'strategies.new_strategy_mbs.2': return 'Аббревиатура';
			case 'strategies.new_strategy_mbs.3': return 'Текст';
			case 'strategies.new_strategy_mbs.4': return 'Сохранить';
			case 'strategies.edit.0': return 'Редактирование';
			case 'strategies.edit.1': return 'Заголовок';
			case 'strategies.edit.2': return 'Аббревиатура';
			case 'strategies.edit.3': return 'Текст';
			case 'strategies.edit.4': return 'Сохранить';
			case 'strategies.delete.0': return 'Подтверждение удаления';
			case 'strategies.delete.1': return 'Данные стратегии будут удалены без возможности восстановления';
			case 'strategies.delete.2': return 'Отменить';
			case 'strategies.delete.3': return 'Удалить';
			case 'matches.appbar': return 'Матчи';
			case 'matches.currency.0': return 'Выигрышная валюта';
			case 'matches.currency.1': return 'ЕВРО/ДОЛЛАР';
			case 'matches.empty_screen.0': return 'Пусто';
			case 'matches.empty_screen.1': return 'У вас еще не добавлено\nни одного матча';
			case 'matches.new_match_mbs.0': return 'Новый матч';
			case 'matches.new_match_mbs.1.date.0': return 'Дата матча';
			case 'matches.new_match_mbs.1.date.1': return 'Сохранить';
			case 'matches.new_match_mbs.2': return 'Счёт игры';
			case 'matches.new_match_mbs.3': return 'Сумма выигрыша';
			case 'matches.new_match_mbs.4': return 'Добавить';
			case 'matches.delete.0': return 'Подтверждение удаления';
			case 'matches.delete.1': return 'Данные матча будут удалены без возможности восстановления';
			case 'matches.delete.2': return 'Отменить';
			case 'matches.delete.3': return 'Удалить';
			case 'settings.appbar': return 'Настройки';
			case 'settings.items.0': return 'Политика использования';
			case 'settings.items.1': return 'Поделиться приложением';
			case 'settings.items.2': return 'Оцените нас';
			default: return null;
		}
	}
}
