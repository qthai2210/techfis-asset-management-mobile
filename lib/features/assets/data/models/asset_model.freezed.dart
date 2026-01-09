// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssetModel {
  @HiveField(0)
  int get id;
  @HiveField(1)
  @JsonKey(name: 'asset_code')
  String get assetCode;
  @HiveField(2)
  String get name;
  @HiveField(3)
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @HiveField(4)
  String? get status;
  @HiveField(5)
  @JsonKey(name: 'purchase_price')
  double? get purchasePrice;
  @HiveField(6)
  String? get model;
  @HiveField(7)
  String? get serial;
  @HiveField(8)
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @HiveField(9)
  String? get condition;
  @HiveField(10)
  @JsonKey(name: 'location_id')
  int? get locationId;
  @HiveField(11)
  @JsonKey(name: 'purchase_date')
  String? get purchaseDate;
  @HiveField(12)
  @JsonKey(name: 'warranty_end')
  String? get warrantyEnd;

  /// Create a copy of AssetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssetModelCopyWith<AssetModel> get copyWith =>
      _$AssetModelCopyWithImpl<AssetModel>(this as AssetModel, _$identity);

  /// Serializes this AssetModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssetModel &&
            super == other &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.assetCode, assetCode) ||
                other.assetCode == assetCode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.purchasePrice, purchasePrice) ||
                other.purchasePrice == purchasePrice) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.serial, serial) || other.serial == serial) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.warrantyEnd, warrantyEnd) ||
                other.warrantyEnd == warrantyEnd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      super.hashCode,
      id,
      assetCode,
      name,
      categoryId,
      status,
      purchasePrice,
      model,
      serial,
      imageUrl,
      condition,
      locationId,
      purchaseDate,
      warrantyEnd);
}

/// @nodoc
abstract mixin class $AssetModelCopyWith<$Res> {
  factory $AssetModelCopyWith(
          AssetModel value, $Res Function(AssetModel) _then) =
      _$AssetModelCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) @JsonKey(name: 'asset_code') String assetCode,
      @HiveField(2) String name,
      @HiveField(3) @JsonKey(name: 'category_id') int? categoryId,
      @HiveField(4) String? status,
      @HiveField(5) @JsonKey(name: 'purchase_price') double? purchasePrice,
      @HiveField(6) String? model,
      @HiveField(7) String? serial,
      @HiveField(8) @JsonKey(name: 'image_url') String? imageUrl,
      @HiveField(9) String? condition,
      @HiveField(10) @JsonKey(name: 'location_id') int? locationId,
      @HiveField(11) @JsonKey(name: 'purchase_date') String? purchaseDate,
      @HiveField(12) @JsonKey(name: 'warranty_end') String? warrantyEnd});
}

/// @nodoc
class _$AssetModelCopyWithImpl<$Res> implements $AssetModelCopyWith<$Res> {
  _$AssetModelCopyWithImpl(this._self, this._then);

  final AssetModel _self;
  final $Res Function(AssetModel) _then;

  /// Create a copy of AssetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? assetCode = null,
    Object? name = null,
    Object? categoryId = freezed,
    Object? status = freezed,
    Object? purchasePrice = freezed,
    Object? model = freezed,
    Object? serial = freezed,
    Object? imageUrl = freezed,
    Object? condition = freezed,
    Object? locationId = freezed,
    Object? purchaseDate = freezed,
    Object? warrantyEnd = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      assetCode: null == assetCode
          ? _self.assetCode
          : assetCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      purchasePrice: freezed == purchasePrice
          ? _self.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      model: freezed == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      serial: freezed == serial
          ? _self.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      condition: freezed == condition
          ? _self.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String?,
      locationId: freezed == locationId
          ? _self.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as int?,
      purchaseDate: freezed == purchaseDate
          ? _self.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      warrantyEnd: freezed == warrantyEnd
          ? _self.warrantyEnd
          : warrantyEnd // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AssetModel].
extension AssetModelPatterns on AssetModel {
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
    TResult Function(_AssetModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssetModel() when $default != null:
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
    TResult Function(_AssetModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssetModel():
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
    TResult? Function(_AssetModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssetModel() when $default != null:
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
            @HiveField(0) int id,
            @HiveField(1) @JsonKey(name: 'asset_code') String assetCode,
            @HiveField(2) String name,
            @HiveField(3) @JsonKey(name: 'category_id') int? categoryId,
            @HiveField(4) String? status,
            @HiveField(5)
            @JsonKey(name: 'purchase_price')
            double? purchasePrice,
            @HiveField(6) String? model,
            @HiveField(7) String? serial,
            @HiveField(8) @JsonKey(name: 'image_url') String? imageUrl,
            @HiveField(9) String? condition,
            @HiveField(10) @JsonKey(name: 'location_id') int? locationId,
            @HiveField(11) @JsonKey(name: 'purchase_date') String? purchaseDate,
            @HiveField(12) @JsonKey(name: 'warranty_end') String? warrantyEnd)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AssetModel() when $default != null:
        return $default(
            _that.id,
            _that.assetCode,
            _that.name,
            _that.categoryId,
            _that.status,
            _that.purchasePrice,
            _that.model,
            _that.serial,
            _that.imageUrl,
            _that.condition,
            _that.locationId,
            _that.purchaseDate,
            _that.warrantyEnd);
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
            @HiveField(0) int id,
            @HiveField(1) @JsonKey(name: 'asset_code') String assetCode,
            @HiveField(2) String name,
            @HiveField(3) @JsonKey(name: 'category_id') int? categoryId,
            @HiveField(4) String? status,
            @HiveField(5)
            @JsonKey(name: 'purchase_price')
            double? purchasePrice,
            @HiveField(6) String? model,
            @HiveField(7) String? serial,
            @HiveField(8) @JsonKey(name: 'image_url') String? imageUrl,
            @HiveField(9) String? condition,
            @HiveField(10) @JsonKey(name: 'location_id') int? locationId,
            @HiveField(11) @JsonKey(name: 'purchase_date') String? purchaseDate,
            @HiveField(12) @JsonKey(name: 'warranty_end') String? warrantyEnd)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssetModel():
        return $default(
            _that.id,
            _that.assetCode,
            _that.name,
            _that.categoryId,
            _that.status,
            _that.purchasePrice,
            _that.model,
            _that.serial,
            _that.imageUrl,
            _that.condition,
            _that.locationId,
            _that.purchaseDate,
            _that.warrantyEnd);
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
            @HiveField(0) int id,
            @HiveField(1) @JsonKey(name: 'asset_code') String assetCode,
            @HiveField(2) String name,
            @HiveField(3) @JsonKey(name: 'category_id') int? categoryId,
            @HiveField(4) String? status,
            @HiveField(5)
            @JsonKey(name: 'purchase_price')
            double? purchasePrice,
            @HiveField(6) String? model,
            @HiveField(7) String? serial,
            @HiveField(8) @JsonKey(name: 'image_url') String? imageUrl,
            @HiveField(9) String? condition,
            @HiveField(10) @JsonKey(name: 'location_id') int? locationId,
            @HiveField(11) @JsonKey(name: 'purchase_date') String? purchaseDate,
            @HiveField(12) @JsonKey(name: 'warranty_end') String? warrantyEnd)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AssetModel() when $default != null:
        return $default(
            _that.id,
            _that.assetCode,
            _that.name,
            _that.categoryId,
            _that.status,
            _that.purchasePrice,
            _that.model,
            _that.serial,
            _that.imageUrl,
            _that.condition,
            _that.locationId,
            _that.purchaseDate,
            _that.warrantyEnd);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AssetModel extends AssetModel {
  const _AssetModel(
      {@HiveField(0) required this.id,
      @HiveField(1) @JsonKey(name: 'asset_code') required this.assetCode,
      @HiveField(2) required this.name,
      @HiveField(3) @JsonKey(name: 'category_id') this.categoryId,
      @HiveField(4) this.status,
      @HiveField(5) @JsonKey(name: 'purchase_price') this.purchasePrice,
      @HiveField(6) this.model,
      @HiveField(7) this.serial,
      @HiveField(8) @JsonKey(name: 'image_url') this.imageUrl,
      @HiveField(9) this.condition,
      @HiveField(10) @JsonKey(name: 'location_id') this.locationId,
      @HiveField(11) @JsonKey(name: 'purchase_date') this.purchaseDate,
      @HiveField(12) @JsonKey(name: 'warranty_end') this.warrantyEnd})
      : super._();
  factory _AssetModel.fromJson(Map<String, dynamic> json) =>
      _$AssetModelFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  @JsonKey(name: 'asset_code')
  final String assetCode;
  @override
  @HiveField(2)
  final String name;
  @override
  @HiveField(3)
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  @HiveField(4)
  final String? status;
  @override
  @HiveField(5)
  @JsonKey(name: 'purchase_price')
  final double? purchasePrice;
  @override
  @HiveField(6)
  final String? model;
  @override
  @HiveField(7)
  final String? serial;
  @override
  @HiveField(8)
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @HiveField(9)
  final String? condition;
  @override
  @HiveField(10)
  @JsonKey(name: 'location_id')
  final int? locationId;
  @override
  @HiveField(11)
  @JsonKey(name: 'purchase_date')
  final String? purchaseDate;
  @override
  @HiveField(12)
  @JsonKey(name: 'warranty_end')
  final String? warrantyEnd;

  /// Create a copy of AssetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssetModelCopyWith<_AssetModel> get copyWith =>
      __$AssetModelCopyWithImpl<_AssetModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AssetModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AssetModel &&
            super == other &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.assetCode, assetCode) ||
                other.assetCode == assetCode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.purchasePrice, purchasePrice) ||
                other.purchasePrice == purchasePrice) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.serial, serial) || other.serial == serial) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.warrantyEnd, warrantyEnd) ||
                other.warrantyEnd == warrantyEnd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      super.hashCode,
      id,
      assetCode,
      name,
      categoryId,
      status,
      purchasePrice,
      model,
      serial,
      imageUrl,
      condition,
      locationId,
      purchaseDate,
      warrantyEnd);
}

/// @nodoc
abstract mixin class _$AssetModelCopyWith<$Res>
    implements $AssetModelCopyWith<$Res> {
  factory _$AssetModelCopyWith(
          _AssetModel value, $Res Function(_AssetModel) _then) =
      __$AssetModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) @JsonKey(name: 'asset_code') String assetCode,
      @HiveField(2) String name,
      @HiveField(3) @JsonKey(name: 'category_id') int? categoryId,
      @HiveField(4) String? status,
      @HiveField(5) @JsonKey(name: 'purchase_price') double? purchasePrice,
      @HiveField(6) String? model,
      @HiveField(7) String? serial,
      @HiveField(8) @JsonKey(name: 'image_url') String? imageUrl,
      @HiveField(9) String? condition,
      @HiveField(10) @JsonKey(name: 'location_id') int? locationId,
      @HiveField(11) @JsonKey(name: 'purchase_date') String? purchaseDate,
      @HiveField(12) @JsonKey(name: 'warranty_end') String? warrantyEnd});
}

/// @nodoc
class __$AssetModelCopyWithImpl<$Res> implements _$AssetModelCopyWith<$Res> {
  __$AssetModelCopyWithImpl(this._self, this._then);

  final _AssetModel _self;
  final $Res Function(_AssetModel) _then;

  /// Create a copy of AssetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? assetCode = null,
    Object? name = null,
    Object? categoryId = freezed,
    Object? status = freezed,
    Object? purchasePrice = freezed,
    Object? model = freezed,
    Object? serial = freezed,
    Object? imageUrl = freezed,
    Object? condition = freezed,
    Object? locationId = freezed,
    Object? purchaseDate = freezed,
    Object? warrantyEnd = freezed,
  }) {
    return _then(_AssetModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      assetCode: null == assetCode
          ? _self.assetCode
          : assetCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      purchasePrice: freezed == purchasePrice
          ? _self.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      model: freezed == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      serial: freezed == serial
          ? _self.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      condition: freezed == condition
          ? _self.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String?,
      locationId: freezed == locationId
          ? _self.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as int?,
      purchaseDate: freezed == purchaseDate
          ? _self.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      warrantyEnd: freezed == warrantyEnd
          ? _self.warrantyEnd
          : warrantyEnd // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
