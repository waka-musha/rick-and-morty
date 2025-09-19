// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavoritesState {

 FavoritesStatus get status; List<Character> get items; Set<int> get favoriteIds; FavoritesSort get sortBy; bool get ascending; String? get error; bool get isRefreshing;
/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoritesStateCopyWith<FavoritesState> get copyWith => _$FavoritesStateCopyWithImpl<FavoritesState>(this as FavoritesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoritesState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.favoriteIds, favoriteIds)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.ascending, ascending) || other.ascending == ascending)&&(identical(other.error, error) || other.error == error)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(favoriteIds),sortBy,ascending,error,isRefreshing);

@override
String toString() {
  return 'FavoritesState(status: $status, items: $items, favoriteIds: $favoriteIds, sortBy: $sortBy, ascending: $ascending, error: $error, isRefreshing: $isRefreshing)';
}


}

/// @nodoc
abstract mixin class $FavoritesStateCopyWith<$Res>  {
  factory $FavoritesStateCopyWith(FavoritesState value, $Res Function(FavoritesState) _then) = _$FavoritesStateCopyWithImpl;
@useResult
$Res call({
 FavoritesStatus status, List<Character> items, Set<int> favoriteIds, FavoritesSort sortBy, bool ascending, String? error, bool isRefreshing
});




}
/// @nodoc
class _$FavoritesStateCopyWithImpl<$Res>
    implements $FavoritesStateCopyWith<$Res> {
  _$FavoritesStateCopyWithImpl(this._self, this._then);

  final FavoritesState _self;
  final $Res Function(FavoritesState) _then;

/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? items = null,Object? favoriteIds = null,Object? sortBy = null,Object? ascending = null,Object? error = freezed,Object? isRefreshing = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FavoritesStatus,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Character>,favoriteIds: null == favoriteIds ? _self.favoriteIds : favoriteIds // ignore: cast_nullable_to_non_nullable
as Set<int>,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as FavoritesSort,ascending: null == ascending ? _self.ascending : ascending // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FavoritesState].
extension FavoritesStatePatterns on FavoritesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoritesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoritesState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoritesState value)  $default,){
final _that = this;
switch (_that) {
case _FavoritesState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoritesState value)?  $default,){
final _that = this;
switch (_that) {
case _FavoritesState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FavoritesStatus status,  List<Character> items,  Set<int> favoriteIds,  FavoritesSort sortBy,  bool ascending,  String? error,  bool isRefreshing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoritesState() when $default != null:
return $default(_that.status,_that.items,_that.favoriteIds,_that.sortBy,_that.ascending,_that.error,_that.isRefreshing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FavoritesStatus status,  List<Character> items,  Set<int> favoriteIds,  FavoritesSort sortBy,  bool ascending,  String? error,  bool isRefreshing)  $default,) {final _that = this;
switch (_that) {
case _FavoritesState():
return $default(_that.status,_that.items,_that.favoriteIds,_that.sortBy,_that.ascending,_that.error,_that.isRefreshing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FavoritesStatus status,  List<Character> items,  Set<int> favoriteIds,  FavoritesSort sortBy,  bool ascending,  String? error,  bool isRefreshing)?  $default,) {final _that = this;
switch (_that) {
case _FavoritesState() when $default != null:
return $default(_that.status,_that.items,_that.favoriteIds,_that.sortBy,_that.ascending,_that.error,_that.isRefreshing);case _:
  return null;

}
}

}

/// @nodoc


class _FavoritesState implements FavoritesState {
  const _FavoritesState({this.status = FavoritesStatus.initial, final  List<Character> items = const <Character>[], final  Set<int> favoriteIds = const <int>{}, this.sortBy = FavoritesSort.name, this.ascending = true, this.error, this.isRefreshing = false}): _items = items,_favoriteIds = favoriteIds;
  

@override@JsonKey() final  FavoritesStatus status;
 final  List<Character> _items;
@override@JsonKey() List<Character> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  Set<int> _favoriteIds;
@override@JsonKey() Set<int> get favoriteIds {
  if (_favoriteIds is EqualUnmodifiableSetView) return _favoriteIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_favoriteIds);
}

@override@JsonKey() final  FavoritesSort sortBy;
@override@JsonKey() final  bool ascending;
@override final  String? error;
@override@JsonKey() final  bool isRefreshing;

/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoritesStateCopyWith<_FavoritesState> get copyWith => __$FavoritesStateCopyWithImpl<_FavoritesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoritesState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._favoriteIds, _favoriteIds)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.ascending, ascending) || other.ascending == ascending)&&(identical(other.error, error) || other.error == error)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_favoriteIds),sortBy,ascending,error,isRefreshing);

@override
String toString() {
  return 'FavoritesState(status: $status, items: $items, favoriteIds: $favoriteIds, sortBy: $sortBy, ascending: $ascending, error: $error, isRefreshing: $isRefreshing)';
}


}

/// @nodoc
abstract mixin class _$FavoritesStateCopyWith<$Res> implements $FavoritesStateCopyWith<$Res> {
  factory _$FavoritesStateCopyWith(_FavoritesState value, $Res Function(_FavoritesState) _then) = __$FavoritesStateCopyWithImpl;
@override @useResult
$Res call({
 FavoritesStatus status, List<Character> items, Set<int> favoriteIds, FavoritesSort sortBy, bool ascending, String? error, bool isRefreshing
});




}
/// @nodoc
class __$FavoritesStateCopyWithImpl<$Res>
    implements _$FavoritesStateCopyWith<$Res> {
  __$FavoritesStateCopyWithImpl(this._self, this._then);

  final _FavoritesState _self;
  final $Res Function(_FavoritesState) _then;

/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? items = null,Object? favoriteIds = null,Object? sortBy = null,Object? ascending = null,Object? error = freezed,Object? isRefreshing = null,}) {
  return _then(_FavoritesState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FavoritesStatus,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Character>,favoriteIds: null == favoriteIds ? _self._favoriteIds : favoriteIds // ignore: cast_nullable_to_non_nullable
as Set<int>,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as FavoritesSort,ascending: null == ascending ? _self.ascending : ascending // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
