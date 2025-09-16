// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'characters_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CharactersPage {

 int get page; int get totalPages; List<Character> get results; bool get hasNext;
/// Create a copy of CharactersPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharactersPageCopyWith<CharactersPage> get copyWith => _$CharactersPageCopyWithImpl<CharactersPage>(this as CharactersPage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharactersPage&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&const DeepCollectionEquality().equals(other.results, results)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}


@override
int get hashCode => Object.hash(runtimeType,page,totalPages,const DeepCollectionEquality().hash(results),hasNext);

@override
String toString() {
  return 'CharactersPage(page: $page, totalPages: $totalPages, results: $results, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class $CharactersPageCopyWith<$Res>  {
  factory $CharactersPageCopyWith(CharactersPage value, $Res Function(CharactersPage) _then) = _$CharactersPageCopyWithImpl;
@useResult
$Res call({
 int page, int totalPages, List<Character> results, bool hasNext
});




}
/// @nodoc
class _$CharactersPageCopyWithImpl<$Res>
    implements $CharactersPageCopyWith<$Res> {
  _$CharactersPageCopyWithImpl(this._self, this._then);

  final CharactersPage _self;
  final $Res Function(CharactersPage) _then;

/// Create a copy of CharactersPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? totalPages = null,Object? results = null,Object? hasNext = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<Character>,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CharactersPage].
extension CharactersPagePatterns on CharactersPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharactersPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharactersPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharactersPage value)  $default,){
final _that = this;
switch (_that) {
case _CharactersPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharactersPage value)?  $default,){
final _that = this;
switch (_that) {
case _CharactersPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int totalPages,  List<Character> results,  bool hasNext)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharactersPage() when $default != null:
return $default(_that.page,_that.totalPages,_that.results,_that.hasNext);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int totalPages,  List<Character> results,  bool hasNext)  $default,) {final _that = this;
switch (_that) {
case _CharactersPage():
return $default(_that.page,_that.totalPages,_that.results,_that.hasNext);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int totalPages,  List<Character> results,  bool hasNext)?  $default,) {final _that = this;
switch (_that) {
case _CharactersPage() when $default != null:
return $default(_that.page,_that.totalPages,_that.results,_that.hasNext);case _:
  return null;

}
}

}

/// @nodoc


class _CharactersPage implements CharactersPage {
  const _CharactersPage({required this.page, required this.totalPages, required final  List<Character> results, required this.hasNext}): _results = results;
  

@override final  int page;
@override final  int totalPages;
 final  List<Character> _results;
@override List<Character> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

@override final  bool hasNext;

/// Create a copy of CharactersPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharactersPageCopyWith<_CharactersPage> get copyWith => __$CharactersPageCopyWithImpl<_CharactersPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharactersPage&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&const DeepCollectionEquality().equals(other._results, _results)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}


@override
int get hashCode => Object.hash(runtimeType,page,totalPages,const DeepCollectionEquality().hash(_results),hasNext);

@override
String toString() {
  return 'CharactersPage(page: $page, totalPages: $totalPages, results: $results, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class _$CharactersPageCopyWith<$Res> implements $CharactersPageCopyWith<$Res> {
  factory _$CharactersPageCopyWith(_CharactersPage value, $Res Function(_CharactersPage) _then) = __$CharactersPageCopyWithImpl;
@override @useResult
$Res call({
 int page, int totalPages, List<Character> results, bool hasNext
});




}
/// @nodoc
class __$CharactersPageCopyWithImpl<$Res>
    implements _$CharactersPageCopyWith<$Res> {
  __$CharactersPageCopyWithImpl(this._self, this._then);

  final _CharactersPage _self;
  final $Res Function(_CharactersPage) _then;

/// Create a copy of CharactersPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? totalPages = null,Object? results = null,Object? hasNext = null,}) {
  return _then(_CharactersPage(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<Character>,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
