// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medicine_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MedicineEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String query) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String query)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String query)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMedicines value) fetch,
    required TResult Function(SearchMedicinesByName value) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMedicines value)? fetch,
    TResult? Function(SearchMedicinesByName value)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMedicines value)? fetch,
    TResult Function(SearchMedicinesByName value)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicineEventCopyWith<$Res> {
  factory $MedicineEventCopyWith(
          MedicineEvent value, $Res Function(MedicineEvent) then) =
      _$MedicineEventCopyWithImpl<$Res, MedicineEvent>;
}

/// @nodoc
class _$MedicineEventCopyWithImpl<$Res, $Val extends MedicineEvent>
    implements $MedicineEventCopyWith<$Res> {
  _$MedicineEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchMedicinesImplCopyWith<$Res> {
  factory _$$FetchMedicinesImplCopyWith(_$FetchMedicinesImpl value,
          $Res Function(_$FetchMedicinesImpl) then) =
      __$$FetchMedicinesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchMedicinesImplCopyWithImpl<$Res>
    extends _$MedicineEventCopyWithImpl<$Res, _$FetchMedicinesImpl>
    implements _$$FetchMedicinesImplCopyWith<$Res> {
  __$$FetchMedicinesImplCopyWithImpl(
      _$FetchMedicinesImpl _value, $Res Function(_$FetchMedicinesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchMedicinesImpl implements FetchMedicines {
  const _$FetchMedicinesImpl();

  @override
  String toString() {
    return 'MedicineEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchMedicinesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String query) search,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String query)? search,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String query)? search,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMedicines value) fetch,
    required TResult Function(SearchMedicinesByName value) search,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMedicines value)? fetch,
    TResult? Function(SearchMedicinesByName value)? search,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMedicines value)? fetch,
    TResult Function(SearchMedicinesByName value)? search,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class FetchMedicines implements MedicineEvent {
  const factory FetchMedicines() = _$FetchMedicinesImpl;
}

/// @nodoc
abstract class _$$SearchMedicinesByNameImplCopyWith<$Res> {
  factory _$$SearchMedicinesByNameImplCopyWith(
          _$SearchMedicinesByNameImpl value,
          $Res Function(_$SearchMedicinesByNameImpl) then) =
      __$$SearchMedicinesByNameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchMedicinesByNameImplCopyWithImpl<$Res>
    extends _$MedicineEventCopyWithImpl<$Res, _$SearchMedicinesByNameImpl>
    implements _$$SearchMedicinesByNameImplCopyWith<$Res> {
  __$$SearchMedicinesByNameImplCopyWithImpl(_$SearchMedicinesByNameImpl _value,
      $Res Function(_$SearchMedicinesByNameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchMedicinesByNameImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchMedicinesByNameImpl implements SearchMedicinesByName {
  const _$SearchMedicinesByNameImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'MedicineEvent.search(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchMedicinesByNameImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchMedicinesByNameImplCopyWith<_$SearchMedicinesByNameImpl>
      get copyWith => __$$SearchMedicinesByNameImplCopyWithImpl<
          _$SearchMedicinesByNameImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String query) search,
  }) {
    return search(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String query)? search,
  }) {
    return search?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String query)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMedicines value) fetch,
    required TResult Function(SearchMedicinesByName value) search,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMedicines value)? fetch,
    TResult? Function(SearchMedicinesByName value)? search,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMedicines value)? fetch,
    TResult Function(SearchMedicinesByName value)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class SearchMedicinesByName implements MedicineEvent {
  const factory SearchMedicinesByName(final String query) =
      _$SearchMedicinesByNameImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$SearchMedicinesByNameImplCopyWith<_$SearchMedicinesByNameImpl>
      get copyWith => throw _privateConstructorUsedError;
}
