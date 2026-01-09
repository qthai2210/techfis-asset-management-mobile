// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ThemeEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ThemeEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ThemeEvent()';
  }
}

/// @nodoc
class $ThemeEventCopyWith<$Res> {
  $ThemeEventCopyWith(ThemeEvent _, $Res Function(ThemeEvent) __);
}

/// Adds pattern-matching-related methods to [ThemeEvent].
extension ThemeEventPatterns on ThemeEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ThemeLoadRequested value)? started,
    TResult Function(ThemeChanged value)? changed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ThemeLoadRequested() when started != null:
        return started(_that);
      case ThemeChanged() when changed != null:
        return changed(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ThemeLoadRequested value) started,
    required TResult Function(ThemeChanged value) changed,
  }) {
    final _that = this;
    switch (_that) {
      case ThemeLoadRequested():
        return started(_that);
      case ThemeChanged():
        return changed(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ThemeLoadRequested value)? started,
    TResult? Function(ThemeChanged value)? changed,
  }) {
    final _that = this;
    switch (_that) {
      case ThemeLoadRequested() when started != null:
        return started(_that);
      case ThemeChanged() when changed != null:
        return changed(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ThemeMode themeMode)? changed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ThemeLoadRequested() when started != null:
        return started();
      case ThemeChanged() when changed != null:
        return changed(_that.themeMode);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ThemeMode themeMode) changed,
  }) {
    final _that = this;
    switch (_that) {
      case ThemeLoadRequested():
        return started();
      case ThemeChanged():
        return changed(_that.themeMode);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ThemeMode themeMode)? changed,
  }) {
    final _that = this;
    switch (_that) {
      case ThemeLoadRequested() when started != null:
        return started();
      case ThemeChanged() when changed != null:
        return changed(_that.themeMode);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ThemeLoadRequested implements ThemeEvent {
  const ThemeLoadRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ThemeLoadRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ThemeEvent.started()';
  }
}

/// @nodoc

class ThemeChanged implements ThemeEvent {
  const ThemeChanged(this.themeMode);

  final ThemeMode themeMode;

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ThemeChangedCopyWith<ThemeChanged> get copyWith =>
      _$ThemeChangedCopyWithImpl<ThemeChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ThemeChanged &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode);

  @override
  String toString() {
    return 'ThemeEvent.changed(themeMode: $themeMode)';
  }
}

/// @nodoc
abstract mixin class $ThemeChangedCopyWith<$Res>
    implements $ThemeEventCopyWith<$Res> {
  factory $ThemeChangedCopyWith(
          ThemeChanged value, $Res Function(ThemeChanged) _then) =
      _$ThemeChangedCopyWithImpl;
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class _$ThemeChangedCopyWithImpl<$Res> implements $ThemeChangedCopyWith<$Res> {
  _$ThemeChangedCopyWithImpl(this._self, this._then);

  final ThemeChanged _self;
  final $Res Function(ThemeChanged) _then;

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(ThemeChanged(
      null == themeMode
          ? _self.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc
mixin _$ThemeState {
  int get themeModeIndex;

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ThemeStateCopyWith<ThemeState> get copyWith =>
      _$ThemeStateCopyWithImpl<ThemeState>(this as ThemeState, _$identity);

  /// Serializes this ThemeState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ThemeState &&
            (identical(other.themeModeIndex, themeModeIndex) ||
                other.themeModeIndex == themeModeIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, themeModeIndex);

  @override
  String toString() {
    return 'ThemeState(themeModeIndex: $themeModeIndex)';
  }
}

/// @nodoc
abstract mixin class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
          ThemeState value, $Res Function(ThemeState) _then) =
      _$ThemeStateCopyWithImpl;
  @useResult
  $Res call({int themeModeIndex});
}

/// @nodoc
class _$ThemeStateCopyWithImpl<$Res> implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._self, this._then);

  final ThemeState _self;
  final $Res Function(ThemeState) _then;

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeModeIndex = null,
  }) {
    return _then(_self.copyWith(
      themeModeIndex: null == themeModeIndex
          ? _self.themeModeIndex
          : themeModeIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [ThemeState].
extension ThemeStatePatterns on ThemeState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ThemeState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ThemeState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ThemeState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ThemeState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ThemeState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ThemeState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int themeModeIndex)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ThemeState() when $default != null:
        return $default(_that.themeModeIndex);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int themeModeIndex) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ThemeState():
        return $default(_that.themeModeIndex);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int themeModeIndex)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ThemeState() when $default != null:
        return $default(_that.themeModeIndex);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ThemeState extends ThemeState {
  const _ThemeState(this.themeModeIndex) : super._();
  factory _ThemeState.fromJson(Map<String, dynamic> json) =>
      _$ThemeStateFromJson(json);

  @override
  final int themeModeIndex;

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ThemeStateCopyWith<_ThemeState> get copyWith =>
      __$ThemeStateCopyWithImpl<_ThemeState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ThemeStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ThemeState &&
            (identical(other.themeModeIndex, themeModeIndex) ||
                other.themeModeIndex == themeModeIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, themeModeIndex);

  @override
  String toString() {
    return 'ThemeState(themeModeIndex: $themeModeIndex)';
  }
}

/// @nodoc
abstract mixin class _$ThemeStateCopyWith<$Res>
    implements $ThemeStateCopyWith<$Res> {
  factory _$ThemeStateCopyWith(
          _ThemeState value, $Res Function(_ThemeState) _then) =
      __$ThemeStateCopyWithImpl;
  @override
  @useResult
  $Res call({int themeModeIndex});
}

/// @nodoc
class __$ThemeStateCopyWithImpl<$Res> implements _$ThemeStateCopyWith<$Res> {
  __$ThemeStateCopyWithImpl(this._self, this._then);

  final _ThemeState _self;
  final $Res Function(_ThemeState) _then;

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? themeModeIndex = null,
  }) {
    return _then(_ThemeState(
      null == themeModeIndex
          ? _self.themeModeIndex
          : themeModeIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
