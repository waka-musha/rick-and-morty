// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'characters_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CharactersState {

 CharactersStatus get status; List<Character> get items; int get page; int get totalPages; bool get hasNext; String? get error; bool get isLoadingMore; bool get isRefreshing;
/// Create a copy of CharactersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharactersStateCopyWith<CharactersState> get copyWith => _$CharactersStateCopyWithImpl<CharactersState>(this as CharactersState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharactersState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.error, error) || other.error == error)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(items),page,totalPages,hasNext,error,isLoadingMore,isRefreshing);

@override
String toString() {
  return 'CharactersState(status: $status, items: $items, page: $page, totalPages: $totalPages, hasNext: $hasNext, error: $error, isLoadingMore: $isLoadingMore, isRefreshing: $isRefreshing)';
}


}

/// @nodoc
abstract mixin class $CharactersStateCopyWith<$Res>  {
  factory $CharactersStateCopyWith(CharactersState value, $Res Function(CharactersState) _then) = _$CharactersStateCopyWithImpl;
@useResult
$Res call({
 CharactersStatus status, List<Character> items, int page, int totalPages, bool hasNext, String? error, bool isLoadingMore, bool isRefreshing
});




}
/// @nodoc
class _$CharactersStateCopyWithImpl<$Res>
    implements $CharactersStateCopyWith<$Res> {
  _$CharactersStateCopyWithImpl(this._self, this._then);

  final CharactersState _self;
  final $Res Function(CharactersState) _then;

/// Create a copy of CharactersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? items = null,Object? page = null,Object? totalPages = null,Object? hasNext = null,Object? error = freezed,Object? isLoadingMore = null,Object? isRefreshing = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CharactersStatus,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Character>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CharactersState].
extension CharactersStatePatterns on CharactersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharactersState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharactersState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharactersState value)  $default,){
final _that = this;
switch (_that) {
case _CharactersState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharactersState value)?  $default,){
final _that = this;
switch (_that) {
case _CharactersState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CharactersStatus status,  List<Character> items,  int page,  int totalPages,  bool hasNext,  String? error,  bool isLoadingMore,  bool isRefreshing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharactersState() when $default != null:
return $default(_that.status,_that.items,_that.page,_that.totalPages,_that.hasNext,_that.error,_that.isLoadingMore,_that.isRefreshing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CharactersStatus status,  List<Character> items,  int page,  int totalPages,  bool hasNext,  String? error,  bool isLoadingMore,  bool isRefreshing)  $default,) {final _that = this;
switch (_that) {
case _CharactersState():
return $default(_that.status,_that.items,_that.page,_that.totalPages,_that.hasNext,_that.error,_that.isLoadingMore,_that.isRefreshing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CharactersStatus status,  List<Character> items,  int page,  int totalPages,  bool hasNext,  String? error,  bool isLoadingMore,  bool isRefreshing)?  $default,) {final _that = this;
switch (_that) {
case _CharactersState() when $default != null:
return $default(_that.status,_that.items,_that.page,_that.totalPages,_that.hasNext,_that.error,_that.isLoadingMore,_that.isRefreshing);case _:
  return null;

}
}

}

/// @nodoc


class _CharactersState implements CharactersState {
  const _CharactersState({this.status = CharactersStatus.initial, final  List<Character> items = const <Character>[], this.page = 1, this.totalPages = 1, this.hasNext = false, this.error, this.isLoadingMore = false, this.isRefreshing = false}): _items = items;
  

@override@JsonKey() final  CharactersStatus status;
 final  List<Character> _items;
@override@JsonKey() List<Character> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int totalPages;
@override@JsonKey() final  bool hasNext;
@override final  String? error;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool isRefreshing;

/// Create a copy of CharactersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharactersStateCopyWith<_CharactersState> get copyWith => __$CharactersStateCopyWithImpl<_CharactersState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharactersState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.error, error) || other.error == error)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_items),page,totalPages,hasNext,error,isLoadingMore,isRefreshing);

@override
String toString() {
  return 'CharactersState(status: $status, items: $items, page: $page, totalPages: $totalPages, hasNext: $hasNext, error: $error, isLoadingMore: $isLoadingMore, isRefreshing: $isRefreshing)';
}


}

/// @nodoc
abstract mixin class _$CharactersStateCopyWith<$Res> implements $CharactersStateCopyWith<$Res> {
  factory _$CharactersStateCopyWith(_CharactersState value, $Res Function(_CharactersState) _then) = __$CharactersStateCopyWithImpl;
@override @useResult
$Res call({
 CharactersStatus status, List<Character> items, int page, int totalPages, bool hasNext, String? error, bool isLoadingMore, bool isRefreshing
});




}
/// @nodoc
class __$CharactersStateCopyWithImpl<$Res>
    implements _$CharactersStateCopyWith<$Res> {
  __$CharactersStateCopyWithImpl(this._self, this._then);

  final _CharactersState _self;
  final $Res Function(_CharactersState) _then;

/// Create a copy of CharactersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? items = null,Object? page = null,Object? totalPages = null,Object? hasNext = null,Object? error = freezed,Object? isLoadingMore = null,Object? isRefreshing = null,}) {
  return _then(_CharactersState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CharactersStatus,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Character>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
