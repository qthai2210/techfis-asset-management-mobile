// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardSummaryModel {
  int get totalAssets;
  int get activeAssets;
  int get inactiveAssets;
  int get totalAssignments;
  int get pendingAssignments;
  int get acceptedAssignments;
  double get totalAssetValue;
  double get totalMaintenanceCost;
  int get userCount;

  /// Create a copy of DashboardSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardSummaryModelCopyWith<DashboardSummaryModel> get copyWith =>
      _$DashboardSummaryModelCopyWithImpl<DashboardSummaryModel>(
          this as DashboardSummaryModel, _$identity);

  /// Serializes this DashboardSummaryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardSummaryModel &&
            super == other &&
            (identical(other.totalAssets, totalAssets) ||
                other.totalAssets == totalAssets) &&
            (identical(other.activeAssets, activeAssets) ||
                other.activeAssets == activeAssets) &&
            (identical(other.inactiveAssets, inactiveAssets) ||
                other.inactiveAssets == inactiveAssets) &&
            (identical(other.totalAssignments, totalAssignments) ||
                other.totalAssignments == totalAssignments) &&
            (identical(other.pendingAssignments, pendingAssignments) ||
                other.pendingAssignments == pendingAssignments) &&
            (identical(other.acceptedAssignments, acceptedAssignments) ||
                other.acceptedAssignments == acceptedAssignments) &&
            (identical(other.totalAssetValue, totalAssetValue) ||
                other.totalAssetValue == totalAssetValue) &&
            (identical(other.totalMaintenanceCost, totalMaintenanceCost) ||
                other.totalMaintenanceCost == totalMaintenanceCost) &&
            (identical(other.userCount, userCount) ||
                other.userCount == userCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      super.hashCode,
      totalAssets,
      activeAssets,
      inactiveAssets,
      totalAssignments,
      pendingAssignments,
      acceptedAssignments,
      totalAssetValue,
      totalMaintenanceCost,
      userCount);
}

/// @nodoc
abstract mixin class $DashboardSummaryModelCopyWith<$Res> {
  factory $DashboardSummaryModelCopyWith(DashboardSummaryModel value,
          $Res Function(DashboardSummaryModel) _then) =
      _$DashboardSummaryModelCopyWithImpl;
  @useResult
  $Res call(
      {int totalAssets,
      int activeAssets,
      int inactiveAssets,
      int totalAssignments,
      int pendingAssignments,
      int acceptedAssignments,
      double totalAssetValue,
      double totalMaintenanceCost,
      int userCount});
}

/// @nodoc
class _$DashboardSummaryModelCopyWithImpl<$Res>
    implements $DashboardSummaryModelCopyWith<$Res> {
  _$DashboardSummaryModelCopyWithImpl(this._self, this._then);

  final DashboardSummaryModel _self;
  final $Res Function(DashboardSummaryModel) _then;

  /// Create a copy of DashboardSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalAssets = null,
    Object? activeAssets = null,
    Object? inactiveAssets = null,
    Object? totalAssignments = null,
    Object? pendingAssignments = null,
    Object? acceptedAssignments = null,
    Object? totalAssetValue = null,
    Object? totalMaintenanceCost = null,
    Object? userCount = null,
  }) {
    return _then(_self.copyWith(
      totalAssets: null == totalAssets
          ? _self.totalAssets
          : totalAssets // ignore: cast_nullable_to_non_nullable
              as int,
      activeAssets: null == activeAssets
          ? _self.activeAssets
          : activeAssets // ignore: cast_nullable_to_non_nullable
              as int,
      inactiveAssets: null == inactiveAssets
          ? _self.inactiveAssets
          : inactiveAssets // ignore: cast_nullable_to_non_nullable
              as int,
      totalAssignments: null == totalAssignments
          ? _self.totalAssignments
          : totalAssignments // ignore: cast_nullable_to_non_nullable
              as int,
      pendingAssignments: null == pendingAssignments
          ? _self.pendingAssignments
          : pendingAssignments // ignore: cast_nullable_to_non_nullable
              as int,
      acceptedAssignments: null == acceptedAssignments
          ? _self.acceptedAssignments
          : acceptedAssignments // ignore: cast_nullable_to_non_nullable
              as int,
      totalAssetValue: null == totalAssetValue
          ? _self.totalAssetValue
          : totalAssetValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalMaintenanceCost: null == totalMaintenanceCost
          ? _self.totalMaintenanceCost
          : totalMaintenanceCost // ignore: cast_nullable_to_non_nullable
              as double,
      userCount: null == userCount
          ? _self.userCount
          : userCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [DashboardSummaryModel].
extension DashboardSummaryModelPatterns on DashboardSummaryModel {
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
    TResult Function(_DashboardSummaryModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardSummaryModel() when $default != null:
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
    TResult Function(_DashboardSummaryModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardSummaryModel():
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
    TResult? Function(_DashboardSummaryModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardSummaryModel() when $default != null:
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
    TResult Function(
            int totalAssets,
            int activeAssets,
            int inactiveAssets,
            int totalAssignments,
            int pendingAssignments,
            int acceptedAssignments,
            double totalAssetValue,
            double totalMaintenanceCost,
            int userCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardSummaryModel() when $default != null:
        return $default(
            _that.totalAssets,
            _that.activeAssets,
            _that.inactiveAssets,
            _that.totalAssignments,
            _that.pendingAssignments,
            _that.acceptedAssignments,
            _that.totalAssetValue,
            _that.totalMaintenanceCost,
            _that.userCount);
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
    TResult Function(
            int totalAssets,
            int activeAssets,
            int inactiveAssets,
            int totalAssignments,
            int pendingAssignments,
            int acceptedAssignments,
            double totalAssetValue,
            double totalMaintenanceCost,
            int userCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardSummaryModel():
        return $default(
            _that.totalAssets,
            _that.activeAssets,
            _that.inactiveAssets,
            _that.totalAssignments,
            _that.pendingAssignments,
            _that.acceptedAssignments,
            _that.totalAssetValue,
            _that.totalMaintenanceCost,
            _that.userCount);
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
    TResult? Function(
            int totalAssets,
            int activeAssets,
            int inactiveAssets,
            int totalAssignments,
            int pendingAssignments,
            int acceptedAssignments,
            double totalAssetValue,
            double totalMaintenanceCost,
            int userCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardSummaryModel() when $default != null:
        return $default(
            _that.totalAssets,
            _that.activeAssets,
            _that.inactiveAssets,
            _that.totalAssignments,
            _that.pendingAssignments,
            _that.acceptedAssignments,
            _that.totalAssetValue,
            _that.totalMaintenanceCost,
            _that.userCount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DashboardSummaryModel extends DashboardSummaryModel {
  const _DashboardSummaryModel(
      {required this.totalAssets,
      required this.activeAssets,
      required this.inactiveAssets,
      required this.totalAssignments,
      required this.pendingAssignments,
      required this.acceptedAssignments,
      required this.totalAssetValue,
      required this.totalMaintenanceCost,
      required this.userCount})
      : super._();
  factory _DashboardSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardSummaryModelFromJson(json);

  @override
  final int totalAssets;
  @override
  final int activeAssets;
  @override
  final int inactiveAssets;
  @override
  final int totalAssignments;
  @override
  final int pendingAssignments;
  @override
  final int acceptedAssignments;
  @override
  final double totalAssetValue;
  @override
  final double totalMaintenanceCost;
  @override
  final int userCount;

  /// Create a copy of DashboardSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DashboardSummaryModelCopyWith<_DashboardSummaryModel> get copyWith =>
      __$DashboardSummaryModelCopyWithImpl<_DashboardSummaryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DashboardSummaryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardSummaryModel &&
            super == other &&
            (identical(other.totalAssets, totalAssets) ||
                other.totalAssets == totalAssets) &&
            (identical(other.activeAssets, activeAssets) ||
                other.activeAssets == activeAssets) &&
            (identical(other.inactiveAssets, inactiveAssets) ||
                other.inactiveAssets == inactiveAssets) &&
            (identical(other.totalAssignments, totalAssignments) ||
                other.totalAssignments == totalAssignments) &&
            (identical(other.pendingAssignments, pendingAssignments) ||
                other.pendingAssignments == pendingAssignments) &&
            (identical(other.acceptedAssignments, acceptedAssignments) ||
                other.acceptedAssignments == acceptedAssignments) &&
            (identical(other.totalAssetValue, totalAssetValue) ||
                other.totalAssetValue == totalAssetValue) &&
            (identical(other.totalMaintenanceCost, totalMaintenanceCost) ||
                other.totalMaintenanceCost == totalMaintenanceCost) &&
            (identical(other.userCount, userCount) ||
                other.userCount == userCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      super.hashCode,
      totalAssets,
      activeAssets,
      inactiveAssets,
      totalAssignments,
      pendingAssignments,
      acceptedAssignments,
      totalAssetValue,
      totalMaintenanceCost,
      userCount);
}

/// @nodoc
abstract mixin class _$DashboardSummaryModelCopyWith<$Res>
    implements $DashboardSummaryModelCopyWith<$Res> {
  factory _$DashboardSummaryModelCopyWith(_DashboardSummaryModel value,
          $Res Function(_DashboardSummaryModel) _then) =
      __$DashboardSummaryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int totalAssets,
      int activeAssets,
      int inactiveAssets,
      int totalAssignments,
      int pendingAssignments,
      int acceptedAssignments,
      double totalAssetValue,
      double totalMaintenanceCost,
      int userCount});
}

/// @nodoc
class __$DashboardSummaryModelCopyWithImpl<$Res>
    implements _$DashboardSummaryModelCopyWith<$Res> {
  __$DashboardSummaryModelCopyWithImpl(this._self, this._then);

  final _DashboardSummaryModel _self;
  final $Res Function(_DashboardSummaryModel) _then;

  /// Create a copy of DashboardSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalAssets = null,
    Object? activeAssets = null,
    Object? inactiveAssets = null,
    Object? totalAssignments = null,
    Object? pendingAssignments = null,
    Object? acceptedAssignments = null,
    Object? totalAssetValue = null,
    Object? totalMaintenanceCost = null,
    Object? userCount = null,
  }) {
    return _then(_DashboardSummaryModel(
      totalAssets: null == totalAssets
          ? _self.totalAssets
          : totalAssets // ignore: cast_nullable_to_non_nullable
              as int,
      activeAssets: null == activeAssets
          ? _self.activeAssets
          : activeAssets // ignore: cast_nullable_to_non_nullable
              as int,
      inactiveAssets: null == inactiveAssets
          ? _self.inactiveAssets
          : inactiveAssets // ignore: cast_nullable_to_non_nullable
              as int,
      totalAssignments: null == totalAssignments
          ? _self.totalAssignments
          : totalAssignments // ignore: cast_nullable_to_non_nullable
              as int,
      pendingAssignments: null == pendingAssignments
          ? _self.pendingAssignments
          : pendingAssignments // ignore: cast_nullable_to_non_nullable
              as int,
      acceptedAssignments: null == acceptedAssignments
          ? _self.acceptedAssignments
          : acceptedAssignments // ignore: cast_nullable_to_non_nullable
              as int,
      totalAssetValue: null == totalAssetValue
          ? _self.totalAssetValue
          : totalAssetValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalMaintenanceCost: null == totalMaintenanceCost
          ? _self.totalMaintenanceCost
          : totalMaintenanceCost // ignore: cast_nullable_to_non_nullable
              as double,
      userCount: null == userCount
          ? _self.userCount
          : userCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$AssetStatusReportModel {
  String get status;
  int get count;
  double get percentage;

  /// Create a copy of AssetStatusReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssetStatusReportModelCopyWith<AssetStatusReportModel> get copyWith =>
      _$AssetStatusReportModelCopyWithImpl<AssetStatusReportModel>(
          this as AssetStatusReportModel, _$identity);

  /// Serializes this AssetStatusReportModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssetStatusReportModel &&
            super == other &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, super.hashCode, status, count, percentage);
}

/// @nodoc
abstract mixin class $AssetStatusReportModelCopyWith<$Res> {
  factory $AssetStatusReportModelCopyWith(AssetStatusReportModel value,
          $Res Function(AssetStatusReportModel) _then) =
      _$AssetStatusReportModelCopyWithImpl;
  @useResult
  $Res call({String status, int count, double percentage});
}

/// @nodoc
class _$AssetStatusReportModelCopyWithImpl<$Res>
    implements $AssetStatusReportModelCopyWith<$Res> {
  _$AssetStatusReportModelCopyWithImpl(this._self, this._then);

  final AssetStatusReportModel _self;
  final $Res Function(AssetStatusReportModel) _then;

  /// Create a copy of AssetStatusReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? count = null,
    Object? percentage = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _self.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [AssetStatusReportModel].
extension AssetStatusReportModelPatterns on AssetStatusReportModel {
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
    TResult Function(_AssetStatusReportModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssetStatusReportModel() when $default != null:
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
    TResult Function(_AssetStatusReportModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssetStatusReportModel():
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
    TResult? Function(_AssetStatusReportModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssetStatusReportModel() when $default != null:
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
    TResult Function(String status, int count, double percentage)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssetStatusReportModel() when $default != null:
        return $default(_that.status, _that.count, _that.percentage);
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
    TResult Function(String status, int count, double percentage) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssetStatusReportModel():
        return $default(_that.status, _that.count, _that.percentage);
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
    TResult? Function(String status, int count, double percentage)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssetStatusReportModel() when $default != null:
        return $default(_that.status, _that.count, _that.percentage);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AssetStatusReportModel extends AssetStatusReportModel {
  const _AssetStatusReportModel(
      {required this.status, required this.count, required this.percentage})
      : super._();
  factory _AssetStatusReportModel.fromJson(Map<String, dynamic> json) =>
      _$AssetStatusReportModelFromJson(json);

  @override
  final String status;
  @override
  final int count;
  @override
  final double percentage;

  /// Create a copy of AssetStatusReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssetStatusReportModelCopyWith<_AssetStatusReportModel> get copyWith =>
      __$AssetStatusReportModelCopyWithImpl<_AssetStatusReportModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AssetStatusReportModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssetStatusReportModel &&
            super == other &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, super.hashCode, status, count, percentage);
}

/// @nodoc
abstract mixin class _$AssetStatusReportModelCopyWith<$Res>
    implements $AssetStatusReportModelCopyWith<$Res> {
  factory _$AssetStatusReportModelCopyWith(_AssetStatusReportModel value,
          $Res Function(_AssetStatusReportModel) _then) =
      __$AssetStatusReportModelCopyWithImpl;
  @override
  @useResult
  $Res call({String status, int count, double percentage});
}

/// @nodoc
class __$AssetStatusReportModelCopyWithImpl<$Res>
    implements _$AssetStatusReportModelCopyWith<$Res> {
  __$AssetStatusReportModelCopyWithImpl(this._self, this._then);

  final _AssetStatusReportModel _self;
  final $Res Function(_AssetStatusReportModel) _then;

  /// Create a copy of AssetStatusReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? count = null,
    Object? percentage = null,
  }) {
    return _then(_AssetStatusReportModel(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _self.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$AssetCategoryReportModel {
  String get categoryId;
  String get categoryName;
  int get count;
  double get totalValue;
  double get percentage;

  /// Create a copy of AssetCategoryReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssetCategoryReportModelCopyWith<AssetCategoryReportModel> get copyWith =>
      _$AssetCategoryReportModelCopyWithImpl<AssetCategoryReportModel>(
          this as AssetCategoryReportModel, _$identity);

  /// Serializes this AssetCategoryReportModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssetCategoryReportModel &&
            super == other &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, super.hashCode, categoryId,
      categoryName, count, totalValue, percentage);
}

/// @nodoc
abstract mixin class $AssetCategoryReportModelCopyWith<$Res> {
  factory $AssetCategoryReportModelCopyWith(AssetCategoryReportModel value,
          $Res Function(AssetCategoryReportModel) _then) =
      _$AssetCategoryReportModelCopyWithImpl;
  @useResult
  $Res call(
      {String categoryId,
      String categoryName,
      int count,
      double totalValue,
      double percentage});
}

/// @nodoc
class _$AssetCategoryReportModelCopyWithImpl<$Res>
    implements $AssetCategoryReportModelCopyWith<$Res> {
  _$AssetCategoryReportModelCopyWithImpl(this._self, this._then);

  final AssetCategoryReportModel _self;
  final $Res Function(AssetCategoryReportModel) _then;

  /// Create a copy of AssetCategoryReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? count = null,
    Object? totalValue = null,
    Object? percentage = null,
  }) {
    return _then(_self.copyWith(
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      totalValue: null == totalValue
          ? _self.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _self.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [AssetCategoryReportModel].
extension AssetCategoryReportModelPatterns on AssetCategoryReportModel {
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
    TResult Function(_AssetCategoryReportModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssetCategoryReportModel() when $default != null:
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
    TResult Function(_AssetCategoryReportModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssetCategoryReportModel():
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
    TResult? Function(_AssetCategoryReportModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssetCategoryReportModel() when $default != null:
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
    TResult Function(String categoryId, String categoryName, int count,
            double totalValue, double percentage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssetCategoryReportModel() when $default != null:
        return $default(_that.categoryId, _that.categoryName, _that.count,
            _that.totalValue, _that.percentage);
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
    TResult Function(String categoryId, String categoryName, int count,
            double totalValue, double percentage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssetCategoryReportModel():
        return $default(_that.categoryId, _that.categoryName, _that.count,
            _that.totalValue, _that.percentage);
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
    TResult? Function(String categoryId, String categoryName, int count,
            double totalValue, double percentage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssetCategoryReportModel() when $default != null:
        return $default(_that.categoryId, _that.categoryName, _that.count,
            _that.totalValue, _that.percentage);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AssetCategoryReportModel extends AssetCategoryReportModel {
  const _AssetCategoryReportModel(
      {required this.categoryId,
      required this.categoryName,
      required this.count,
      required this.totalValue,
      required this.percentage})
      : super._();
  factory _AssetCategoryReportModel.fromJson(Map<String, dynamic> json) =>
      _$AssetCategoryReportModelFromJson(json);

  @override
  final String categoryId;
  @override
  final String categoryName;
  @override
  final int count;
  @override
  final double totalValue;
  @override
  final double percentage;

  /// Create a copy of AssetCategoryReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssetCategoryReportModelCopyWith<_AssetCategoryReportModel> get copyWith =>
      __$AssetCategoryReportModelCopyWithImpl<_AssetCategoryReportModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AssetCategoryReportModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssetCategoryReportModel &&
            super == other &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, super.hashCode, categoryId,
      categoryName, count, totalValue, percentage);
}

/// @nodoc
abstract mixin class _$AssetCategoryReportModelCopyWith<$Res>
    implements $AssetCategoryReportModelCopyWith<$Res> {
  factory _$AssetCategoryReportModelCopyWith(_AssetCategoryReportModel value,
          $Res Function(_AssetCategoryReportModel) _then) =
      __$AssetCategoryReportModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String categoryId,
      String categoryName,
      int count,
      double totalValue,
      double percentage});
}

/// @nodoc
class __$AssetCategoryReportModelCopyWithImpl<$Res>
    implements _$AssetCategoryReportModelCopyWith<$Res> {
  __$AssetCategoryReportModelCopyWithImpl(this._self, this._then);

  final _AssetCategoryReportModel _self;
  final $Res Function(_AssetCategoryReportModel) _then;

  /// Create a copy of AssetCategoryReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? count = null,
    Object? totalValue = null,
    Object? percentage = null,
  }) {
    return _then(_AssetCategoryReportModel(
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      totalValue: null == totalValue
          ? _self.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _self.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$AssignmentReportModel {
  String get id;
  String get assetCode;
  @JsonKey(name: 'assetName')
  String get assetName;
  @JsonKey(name: 'assignedToName')
  String get assignedTo;
  String get status;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of AssignmentReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssignmentReportModelCopyWith<AssignmentReportModel> get copyWith =>
      _$AssignmentReportModelCopyWithImpl<AssignmentReportModel>(
          this as AssignmentReportModel, _$identity);

  /// Serializes this AssignmentReportModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssignmentReportModel &&
            super == other &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.assetCode, assetCode) ||
                other.assetCode == assetCode) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, super.hashCode, id, assetCode,
      assetName, assignedTo, status, createdAt);
}

/// @nodoc
abstract mixin class $AssignmentReportModelCopyWith<$Res> {
  factory $AssignmentReportModelCopyWith(AssignmentReportModel value,
          $Res Function(AssignmentReportModel) _then) =
      _$AssignmentReportModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String assetCode,
      @JsonKey(name: 'assetName') String assetName,
      @JsonKey(name: 'assignedToName') String assignedTo,
      String status,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$AssignmentReportModelCopyWithImpl<$Res>
    implements $AssignmentReportModelCopyWith<$Res> {
  _$AssignmentReportModelCopyWithImpl(this._self, this._then);

  final AssignmentReportModel _self;
  final $Res Function(AssignmentReportModel) _then;

  /// Create a copy of AssignmentReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? assetCode = null,
    Object? assetName = null,
    Object? assignedTo = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      assetCode: null == assetCode
          ? _self.assetCode
          : assetCode // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _self.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      assignedTo: null == assignedTo
          ? _self.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [AssignmentReportModel].
extension AssignmentReportModelPatterns on AssignmentReportModel {
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
    TResult Function(_AssignmentReportModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssignmentReportModel() when $default != null:
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
    TResult Function(_AssignmentReportModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssignmentReportModel():
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
    TResult? Function(_AssignmentReportModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssignmentReportModel() when $default != null:
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
    TResult Function(
            String id,
            String assetCode,
            @JsonKey(name: 'assetName') String assetName,
            @JsonKey(name: 'assignedToName') String assignedTo,
            String status,
            @JsonKey(name: 'created_at') DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssignmentReportModel() when $default != null:
        return $default(_that.id, _that.assetCode, _that.assetName,
            _that.assignedTo, _that.status, _that.createdAt);
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
    TResult Function(
            String id,
            String assetCode,
            @JsonKey(name: 'assetName') String assetName,
            @JsonKey(name: 'assignedToName') String assignedTo,
            String status,
            @JsonKey(name: 'created_at') DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssignmentReportModel():
        return $default(_that.id, _that.assetCode, _that.assetName,
            _that.assignedTo, _that.status, _that.createdAt);
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
    TResult? Function(
            String id,
            String assetCode,
            @JsonKey(name: 'assetName') String assetName,
            @JsonKey(name: 'assignedToName') String assignedTo,
            String status,
            @JsonKey(name: 'created_at') DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssignmentReportModel() when $default != null:
        return $default(_that.id, _that.assetCode, _that.assetName,
            _that.assignedTo, _that.status, _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AssignmentReportModel extends AssignmentReportModel {
  const _AssignmentReportModel(
      {required this.id,
      this.assetCode = 'N/A',
      @JsonKey(name: 'assetName') required this.assetName,
      @JsonKey(name: 'assignedToName') required this.assignedTo,
      this.status = 'PENDING',
      @JsonKey(name: 'created_at') required this.createdAt})
      : super._();
  factory _AssignmentReportModel.fromJson(Map<String, dynamic> json) =>
      _$AssignmentReportModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String assetCode;
  @override
  @JsonKey(name: 'assetName')
  final String assetName;
  @override
  @JsonKey(name: 'assignedToName')
  final String assignedTo;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  /// Create a copy of AssignmentReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssignmentReportModelCopyWith<_AssignmentReportModel> get copyWith =>
      __$AssignmentReportModelCopyWithImpl<_AssignmentReportModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AssignmentReportModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssignmentReportModel &&
            super == other &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.assetCode, assetCode) ||
                other.assetCode == assetCode) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, super.hashCode, id, assetCode,
      assetName, assignedTo, status, createdAt);
}

/// @nodoc
abstract mixin class _$AssignmentReportModelCopyWith<$Res>
    implements $AssignmentReportModelCopyWith<$Res> {
  factory _$AssignmentReportModelCopyWith(_AssignmentReportModel value,
          $Res Function(_AssignmentReportModel) _then) =
      __$AssignmentReportModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String assetCode,
      @JsonKey(name: 'assetName') String assetName,
      @JsonKey(name: 'assignedToName') String assignedTo,
      String status,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$AssignmentReportModelCopyWithImpl<$Res>
    implements _$AssignmentReportModelCopyWith<$Res> {
  __$AssignmentReportModelCopyWithImpl(this._self, this._then);

  final _AssignmentReportModel _self;
  final $Res Function(_AssignmentReportModel) _then;

  /// Create a copy of AssignmentReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? assetCode = null,
    Object? assetName = null,
    Object? assignedTo = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_AssignmentReportModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      assetCode: null == assetCode
          ? _self.assetCode
          : assetCode // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _self.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      assignedTo: null == assignedTo
          ? _self.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$AssignmentMetricsModel {
  int get total;
  int get totalAccepted;
  int get totalPending;
  int get totalRejected;

  /// Create a copy of AssignmentMetricsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssignmentMetricsModelCopyWith<AssignmentMetricsModel> get copyWith =>
      _$AssignmentMetricsModelCopyWithImpl<AssignmentMetricsModel>(
          this as AssignmentMetricsModel, _$identity);

  /// Serializes this AssignmentMetricsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssignmentMetricsModel &&
            super == other &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalAccepted, totalAccepted) ||
                other.totalAccepted == totalAccepted) &&
            (identical(other.totalPending, totalPending) ||
                other.totalPending == totalPending) &&
            (identical(other.totalRejected, totalRejected) ||
                other.totalRejected == totalRejected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, super.hashCode, total,
      totalAccepted, totalPending, totalRejected);
}

/// @nodoc
abstract mixin class $AssignmentMetricsModelCopyWith<$Res> {
  factory $AssignmentMetricsModelCopyWith(AssignmentMetricsModel value,
          $Res Function(AssignmentMetricsModel) _then) =
      _$AssignmentMetricsModelCopyWithImpl;
  @useResult
  $Res call(
      {int total, int totalAccepted, int totalPending, int totalRejected});
}

/// @nodoc
class _$AssignmentMetricsModelCopyWithImpl<$Res>
    implements $AssignmentMetricsModelCopyWith<$Res> {
  _$AssignmentMetricsModelCopyWithImpl(this._self, this._then);

  final AssignmentMetricsModel _self;
  final $Res Function(AssignmentMetricsModel) _then;

  /// Create a copy of AssignmentMetricsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? totalAccepted = null,
    Object? totalPending = null,
    Object? totalRejected = null,
  }) {
    return _then(_self.copyWith(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalAccepted: null == totalAccepted
          ? _self.totalAccepted
          : totalAccepted // ignore: cast_nullable_to_non_nullable
              as int,
      totalPending: null == totalPending
          ? _self.totalPending
          : totalPending // ignore: cast_nullable_to_non_nullable
              as int,
      totalRejected: null == totalRejected
          ? _self.totalRejected
          : totalRejected // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [AssignmentMetricsModel].
extension AssignmentMetricsModelPatterns on AssignmentMetricsModel {
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
    TResult Function(_AssignmentMetricsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssignmentMetricsModel() when $default != null:
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
    TResult Function(_AssignmentMetricsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssignmentMetricsModel():
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
    TResult? Function(_AssignmentMetricsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssignmentMetricsModel() when $default != null:
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
    TResult Function(
            int total, int totalAccepted, int totalPending, int totalRejected)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssignmentMetricsModel() when $default != null:
        return $default(_that.total, _that.totalAccepted, _that.totalPending,
            _that.totalRejected);
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
    TResult Function(
            int total, int totalAccepted, int totalPending, int totalRejected)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssignmentMetricsModel():
        return $default(_that.total, _that.totalAccepted, _that.totalPending,
            _that.totalRejected);
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
    TResult? Function(
            int total, int totalAccepted, int totalPending, int totalRejected)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssignmentMetricsModel() when $default != null:
        return $default(_that.total, _that.totalAccepted, _that.totalPending,
            _that.totalRejected);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AssignmentMetricsModel extends AssignmentMetricsModel {
  const _AssignmentMetricsModel(
      {required this.total,
      required this.totalAccepted,
      required this.totalPending,
      required this.totalRejected})
      : super._();
  factory _AssignmentMetricsModel.fromJson(Map<String, dynamic> json) =>
      _$AssignmentMetricsModelFromJson(json);

  @override
  final int total;
  @override
  final int totalAccepted;
  @override
  final int totalPending;
  @override
  final int totalRejected;

  /// Create a copy of AssignmentMetricsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssignmentMetricsModelCopyWith<_AssignmentMetricsModel> get copyWith =>
      __$AssignmentMetricsModelCopyWithImpl<_AssignmentMetricsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AssignmentMetricsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssignmentMetricsModel &&
            super == other &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalAccepted, totalAccepted) ||
                other.totalAccepted == totalAccepted) &&
            (identical(other.totalPending, totalPending) ||
                other.totalPending == totalPending) &&
            (identical(other.totalRejected, totalRejected) ||
                other.totalRejected == totalRejected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, super.hashCode, total,
      totalAccepted, totalPending, totalRejected);
}

/// @nodoc
abstract mixin class _$AssignmentMetricsModelCopyWith<$Res>
    implements $AssignmentMetricsModelCopyWith<$Res> {
  factory _$AssignmentMetricsModelCopyWith(_AssignmentMetricsModel value,
          $Res Function(_AssignmentMetricsModel) _then) =
      __$AssignmentMetricsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int total, int totalAccepted, int totalPending, int totalRejected});
}

/// @nodoc
class __$AssignmentMetricsModelCopyWithImpl<$Res>
    implements _$AssignmentMetricsModelCopyWith<$Res> {
  __$AssignmentMetricsModelCopyWithImpl(this._self, this._then);

  final _AssignmentMetricsModel _self;
  final $Res Function(_AssignmentMetricsModel) _then;

  /// Create a copy of AssignmentMetricsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
    Object? totalAccepted = null,
    Object? totalPending = null,
    Object? totalRejected = null,
  }) {
    return _then(_AssignmentMetricsModel(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalAccepted: null == totalAccepted
          ? _self.totalAccepted
          : totalAccepted // ignore: cast_nullable_to_non_nullable
              as int,
      totalPending: null == totalPending
          ? _self.totalPending
          : totalPending // ignore: cast_nullable_to_non_nullable
              as int,
      totalRejected: null == totalRejected
          ? _self.totalRejected
          : totalRejected // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$InvoiceMetricsModel {
  int get total;
  int get totalPaid;
  int get totalPending;
  int get totalOverdue;
  int get totalDraft;

  /// Create a copy of InvoiceMetricsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvoiceMetricsModelCopyWith<InvoiceMetricsModel> get copyWith =>
      _$InvoiceMetricsModelCopyWithImpl<InvoiceMetricsModel>(
          this as InvoiceMetricsModel, _$identity);

  /// Serializes this InvoiceMetricsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvoiceMetricsModel &&
            super == other &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPaid, totalPaid) ||
                other.totalPaid == totalPaid) &&
            (identical(other.totalPending, totalPending) ||
                other.totalPending == totalPending) &&
            (identical(other.totalOverdue, totalOverdue) ||
                other.totalOverdue == totalOverdue) &&
            (identical(other.totalDraft, totalDraft) ||
                other.totalDraft == totalDraft));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, super.hashCode, total, totalPaid,
      totalPending, totalOverdue, totalDraft);
}

/// @nodoc
abstract mixin class $InvoiceMetricsModelCopyWith<$Res> {
  factory $InvoiceMetricsModelCopyWith(
          InvoiceMetricsModel value, $Res Function(InvoiceMetricsModel) _then) =
      _$InvoiceMetricsModelCopyWithImpl;
  @useResult
  $Res call(
      {int total,
      int totalPaid,
      int totalPending,
      int totalOverdue,
      int totalDraft});
}

/// @nodoc
class _$InvoiceMetricsModelCopyWithImpl<$Res>
    implements $InvoiceMetricsModelCopyWith<$Res> {
  _$InvoiceMetricsModelCopyWithImpl(this._self, this._then);

  final InvoiceMetricsModel _self;
  final $Res Function(InvoiceMetricsModel) _then;

  /// Create a copy of InvoiceMetricsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? totalPaid = null,
    Object? totalPending = null,
    Object? totalOverdue = null,
    Object? totalDraft = null,
  }) {
    return _then(_self.copyWith(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalPaid: null == totalPaid
          ? _self.totalPaid
          : totalPaid // ignore: cast_nullable_to_non_nullable
              as int,
      totalPending: null == totalPending
          ? _self.totalPending
          : totalPending // ignore: cast_nullable_to_non_nullable
              as int,
      totalOverdue: null == totalOverdue
          ? _self.totalOverdue
          : totalOverdue // ignore: cast_nullable_to_non_nullable
              as int,
      totalDraft: null == totalDraft
          ? _self.totalDraft
          : totalDraft // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [InvoiceMetricsModel].
extension InvoiceMetricsModelPatterns on InvoiceMetricsModel {
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
    TResult Function(_InvoiceMetricsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceMetricsModel() when $default != null:
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
    TResult Function(_InvoiceMetricsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceMetricsModel():
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
    TResult? Function(_InvoiceMetricsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceMetricsModel() when $default != null:
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
    TResult Function(int total, int totalPaid, int totalPending,
            int totalOverdue, int totalDraft)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvoiceMetricsModel() when $default != null:
        return $default(_that.total, _that.totalPaid, _that.totalPending,
            _that.totalOverdue, _that.totalDraft);
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
    TResult Function(int total, int totalPaid, int totalPending,
            int totalOverdue, int totalDraft)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceMetricsModel():
        return $default(_that.total, _that.totalPaid, _that.totalPending,
            _that.totalOverdue, _that.totalDraft);
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
    TResult? Function(int total, int totalPaid, int totalPending,
            int totalOverdue, int totalDraft)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvoiceMetricsModel() when $default != null:
        return $default(_that.total, _that.totalPaid, _that.totalPending,
            _that.totalOverdue, _that.totalDraft);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InvoiceMetricsModel extends InvoiceMetricsModel {
  const _InvoiceMetricsModel(
      {required this.total,
      required this.totalPaid,
      required this.totalPending,
      required this.totalOverdue,
      required this.totalDraft})
      : super._();
  factory _InvoiceMetricsModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceMetricsModelFromJson(json);

  @override
  final int total;
  @override
  final int totalPaid;
  @override
  final int totalPending;
  @override
  final int totalOverdue;
  @override
  final int totalDraft;

  /// Create a copy of InvoiceMetricsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvoiceMetricsModelCopyWith<_InvoiceMetricsModel> get copyWith =>
      __$InvoiceMetricsModelCopyWithImpl<_InvoiceMetricsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InvoiceMetricsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoiceMetricsModel &&
            super == other &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPaid, totalPaid) ||
                other.totalPaid == totalPaid) &&
            (identical(other.totalPending, totalPending) ||
                other.totalPending == totalPending) &&
            (identical(other.totalOverdue, totalOverdue) ||
                other.totalOverdue == totalOverdue) &&
            (identical(other.totalDraft, totalDraft) ||
                other.totalDraft == totalDraft));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, super.hashCode, total, totalPaid,
      totalPending, totalOverdue, totalDraft);
}

/// @nodoc
abstract mixin class _$InvoiceMetricsModelCopyWith<$Res>
    implements $InvoiceMetricsModelCopyWith<$Res> {
  factory _$InvoiceMetricsModelCopyWith(_InvoiceMetricsModel value,
          $Res Function(_InvoiceMetricsModel) _then) =
      __$InvoiceMetricsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int total,
      int totalPaid,
      int totalPending,
      int totalOverdue,
      int totalDraft});
}

/// @nodoc
class __$InvoiceMetricsModelCopyWithImpl<$Res>
    implements _$InvoiceMetricsModelCopyWith<$Res> {
  __$InvoiceMetricsModelCopyWithImpl(this._self, this._then);

  final _InvoiceMetricsModel _self;
  final $Res Function(_InvoiceMetricsModel) _then;

  /// Create a copy of InvoiceMetricsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
    Object? totalPaid = null,
    Object? totalPending = null,
    Object? totalOverdue = null,
    Object? totalDraft = null,
  }) {
    return _then(_InvoiceMetricsModel(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalPaid: null == totalPaid
          ? _self.totalPaid
          : totalPaid // ignore: cast_nullable_to_non_nullable
              as int,
      totalPending: null == totalPending
          ? _self.totalPending
          : totalPending // ignore: cast_nullable_to_non_nullable
              as int,
      totalOverdue: null == totalOverdue
          ? _self.totalOverdue
          : totalOverdue // ignore: cast_nullable_to_non_nullable
              as int,
      totalDraft: null == totalDraft
          ? _self.totalDraft
          : totalDraft // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$MaintenanceMetricsModel {
  int get total;
  int get totalCompleted;
  int get totalInProgress;
  int get totalScheduled;
  int get totalFailed;

  /// Create a copy of MaintenanceMetricsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MaintenanceMetricsModelCopyWith<MaintenanceMetricsModel> get copyWith =>
      _$MaintenanceMetricsModelCopyWithImpl<MaintenanceMetricsModel>(
          this as MaintenanceMetricsModel, _$identity);

  /// Serializes this MaintenanceMetricsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MaintenanceMetricsModel &&
            super == other &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalCompleted, totalCompleted) ||
                other.totalCompleted == totalCompleted) &&
            (identical(other.totalInProgress, totalInProgress) ||
                other.totalInProgress == totalInProgress) &&
            (identical(other.totalScheduled, totalScheduled) ||
                other.totalScheduled == totalScheduled) &&
            (identical(other.totalFailed, totalFailed) ||
                other.totalFailed == totalFailed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, super.hashCode, total,
      totalCompleted, totalInProgress, totalScheduled, totalFailed);
}

/// @nodoc
abstract mixin class $MaintenanceMetricsModelCopyWith<$Res> {
  factory $MaintenanceMetricsModelCopyWith(MaintenanceMetricsModel value,
          $Res Function(MaintenanceMetricsModel) _then) =
      _$MaintenanceMetricsModelCopyWithImpl;
  @useResult
  $Res call(
      {int total,
      int totalCompleted,
      int totalInProgress,
      int totalScheduled,
      int totalFailed});
}

/// @nodoc
class _$MaintenanceMetricsModelCopyWithImpl<$Res>
    implements $MaintenanceMetricsModelCopyWith<$Res> {
  _$MaintenanceMetricsModelCopyWithImpl(this._self, this._then);

  final MaintenanceMetricsModel _self;
  final $Res Function(MaintenanceMetricsModel) _then;

  /// Create a copy of MaintenanceMetricsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? totalCompleted = null,
    Object? totalInProgress = null,
    Object? totalScheduled = null,
    Object? totalFailed = null,
  }) {
    return _then(_self.copyWith(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalCompleted: null == totalCompleted
          ? _self.totalCompleted
          : totalCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      totalInProgress: null == totalInProgress
          ? _self.totalInProgress
          : totalInProgress // ignore: cast_nullable_to_non_nullable
              as int,
      totalScheduled: null == totalScheduled
          ? _self.totalScheduled
          : totalScheduled // ignore: cast_nullable_to_non_nullable
              as int,
      totalFailed: null == totalFailed
          ? _self.totalFailed
          : totalFailed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [MaintenanceMetricsModel].
extension MaintenanceMetricsModelPatterns on MaintenanceMetricsModel {
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
    TResult Function(_MaintenanceMetricsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MaintenanceMetricsModel() when $default != null:
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
    TResult Function(_MaintenanceMetricsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MaintenanceMetricsModel():
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
    TResult? Function(_MaintenanceMetricsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MaintenanceMetricsModel() when $default != null:
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
    TResult Function(int total, int totalCompleted, int totalInProgress,
            int totalScheduled, int totalFailed)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MaintenanceMetricsModel() when $default != null:
        return $default(_that.total, _that.totalCompleted,
            _that.totalInProgress, _that.totalScheduled, _that.totalFailed);
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
    TResult Function(int total, int totalCompleted, int totalInProgress,
            int totalScheduled, int totalFailed)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MaintenanceMetricsModel():
        return $default(_that.total, _that.totalCompleted,
            _that.totalInProgress, _that.totalScheduled, _that.totalFailed);
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
    TResult? Function(int total, int totalCompleted, int totalInProgress,
            int totalScheduled, int totalFailed)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MaintenanceMetricsModel() when $default != null:
        return $default(_that.total, _that.totalCompleted,
            _that.totalInProgress, _that.totalScheduled, _that.totalFailed);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MaintenanceMetricsModel extends MaintenanceMetricsModel {
  const _MaintenanceMetricsModel(
      {required this.total,
      required this.totalCompleted,
      required this.totalInProgress,
      required this.totalScheduled,
      required this.totalFailed})
      : super._();
  factory _MaintenanceMetricsModel.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceMetricsModelFromJson(json);

  @override
  final int total;
  @override
  final int totalCompleted;
  @override
  final int totalInProgress;
  @override
  final int totalScheduled;
  @override
  final int totalFailed;

  /// Create a copy of MaintenanceMetricsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MaintenanceMetricsModelCopyWith<_MaintenanceMetricsModel> get copyWith =>
      __$MaintenanceMetricsModelCopyWithImpl<_MaintenanceMetricsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MaintenanceMetricsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MaintenanceMetricsModel &&
            super == other &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalCompleted, totalCompleted) ||
                other.totalCompleted == totalCompleted) &&
            (identical(other.totalInProgress, totalInProgress) ||
                other.totalInProgress == totalInProgress) &&
            (identical(other.totalScheduled, totalScheduled) ||
                other.totalScheduled == totalScheduled) &&
            (identical(other.totalFailed, totalFailed) ||
                other.totalFailed == totalFailed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, super.hashCode, total,
      totalCompleted, totalInProgress, totalScheduled, totalFailed);
}

/// @nodoc
abstract mixin class _$MaintenanceMetricsModelCopyWith<$Res>
    implements $MaintenanceMetricsModelCopyWith<$Res> {
  factory _$MaintenanceMetricsModelCopyWith(_MaintenanceMetricsModel value,
          $Res Function(_MaintenanceMetricsModel) _then) =
      __$MaintenanceMetricsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int total,
      int totalCompleted,
      int totalInProgress,
      int totalScheduled,
      int totalFailed});
}

/// @nodoc
class __$MaintenanceMetricsModelCopyWithImpl<$Res>
    implements _$MaintenanceMetricsModelCopyWith<$Res> {
  __$MaintenanceMetricsModelCopyWithImpl(this._self, this._then);

  final _MaintenanceMetricsModel _self;
  final $Res Function(_MaintenanceMetricsModel) _then;

  /// Create a copy of MaintenanceMetricsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
    Object? totalCompleted = null,
    Object? totalInProgress = null,
    Object? totalScheduled = null,
    Object? totalFailed = null,
  }) {
    return _then(_MaintenanceMetricsModel(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalCompleted: null == totalCompleted
          ? _self.totalCompleted
          : totalCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      totalInProgress: null == totalInProgress
          ? _self.totalInProgress
          : totalInProgress // ignore: cast_nullable_to_non_nullable
              as int,
      totalScheduled: null == totalScheduled
          ? _self.totalScheduled
          : totalScheduled // ignore: cast_nullable_to_non_nullable
              as int,
      totalFailed: null == totalFailed
          ? _self.totalFailed
          : totalFailed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$CategoryMetricsModel {
  List<AssetCategoryReportModel> get data;
  int get total;

  /// Create a copy of CategoryMetricsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryMetricsModelCopyWith<CategoryMetricsModel> get copyWith =>
      _$CategoryMetricsModelCopyWithImpl<CategoryMetricsModel>(
          this as CategoryMetricsModel, _$identity);

  /// Serializes this CategoryMetricsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryMetricsModel &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(data), total);

  @override
  String toString() {
    return 'CategoryMetricsModel(data: $data, total: $total)';
  }
}

/// @nodoc
abstract mixin class $CategoryMetricsModelCopyWith<$Res> {
  factory $CategoryMetricsModelCopyWith(CategoryMetricsModel value,
          $Res Function(CategoryMetricsModel) _then) =
      _$CategoryMetricsModelCopyWithImpl;
  @useResult
  $Res call({List<AssetCategoryReportModel> data, int total});
}

/// @nodoc
class _$CategoryMetricsModelCopyWithImpl<$Res>
    implements $CategoryMetricsModelCopyWith<$Res> {
  _$CategoryMetricsModelCopyWithImpl(this._self, this._then);

  final CategoryMetricsModel _self;
  final $Res Function(CategoryMetricsModel) _then;

  /// Create a copy of CategoryMetricsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = null,
  }) {
    return _then(_self.copyWith(
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AssetCategoryReportModel>,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [CategoryMetricsModel].
extension CategoryMetricsModelPatterns on CategoryMetricsModel {
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
    TResult Function(_CategoryMetricsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryMetricsModel() when $default != null:
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
    TResult Function(_CategoryMetricsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryMetricsModel():
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
    TResult? Function(_CategoryMetricsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryMetricsModel() when $default != null:
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
    TResult Function(List<AssetCategoryReportModel> data, int total)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryMetricsModel() when $default != null:
        return $default(_that.data, _that.total);
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
    TResult Function(List<AssetCategoryReportModel> data, int total) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryMetricsModel():
        return $default(_that.data, _that.total);
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
    TResult? Function(List<AssetCategoryReportModel> data, int total)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryMetricsModel() when $default != null:
        return $default(_that.data, _that.total);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CategoryMetricsModel extends CategoryMetricsModel {
  const _CategoryMetricsModel(
      {required final List<AssetCategoryReportModel> data, required this.total})
      : _data = data,
        super._();
  factory _CategoryMetricsModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryMetricsModelFromJson(json);

  final List<AssetCategoryReportModel> _data;
  @override
  List<AssetCategoryReportModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int total;

  /// Create a copy of CategoryMetricsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryMetricsModelCopyWith<_CategoryMetricsModel> get copyWith =>
      __$CategoryMetricsModelCopyWithImpl<_CategoryMetricsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryMetricsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryMetricsModel &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), total);

  @override
  String toString() {
    return 'CategoryMetricsModel(data: $data, total: $total)';
  }
}

/// @nodoc
abstract mixin class _$CategoryMetricsModelCopyWith<$Res>
    implements $CategoryMetricsModelCopyWith<$Res> {
  factory _$CategoryMetricsModelCopyWith(_CategoryMetricsModel value,
          $Res Function(_CategoryMetricsModel) _then) =
      __$CategoryMetricsModelCopyWithImpl;
  @override
  @useResult
  $Res call({List<AssetCategoryReportModel> data, int total});
}

/// @nodoc
class __$CategoryMetricsModelCopyWithImpl<$Res>
    implements _$CategoryMetricsModelCopyWith<$Res> {
  __$CategoryMetricsModelCopyWithImpl(this._self, this._then);

  final _CategoryMetricsModel _self;
  final $Res Function(_CategoryMetricsModel) _then;

  /// Create a copy of CategoryMetricsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? total = null,
  }) {
    return _then(_CategoryMetricsModel(
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AssetCategoryReportModel>,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
