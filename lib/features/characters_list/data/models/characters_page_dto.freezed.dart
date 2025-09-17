// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'characters_page_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharactersPageDto {

 InfoDto get info; List<CharacterDto> get results;
/// Create a copy of CharactersPageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharactersPageDtoCopyWith<CharactersPageDto> get copyWith => _$CharactersPageDtoCopyWithImpl<CharactersPageDto>(this as CharactersPageDto, _$identity);

  /// Serializes this CharactersPageDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharactersPageDto&&(identical(other.info, info) || other.info == info)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,info,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'CharactersPageDto(info: $info, results: $results)';
}


}

/// @nodoc
abstract mixin class $CharactersPageDtoCopyWith<$Res>  {
  factory $CharactersPageDtoCopyWith(CharactersPageDto value, $Res Function(CharactersPageDto) _then) = _$CharactersPageDtoCopyWithImpl;
@useResult
$Res call({
 InfoDto info, List<CharacterDto> results
});


$InfoDtoCopyWith<$Res> get info;

}
/// @nodoc
class _$CharactersPageDtoCopyWithImpl<$Res>
    implements $CharactersPageDtoCopyWith<$Res> {
  _$CharactersPageDtoCopyWithImpl(this._self, this._then);

  final CharactersPageDto _self;
  final $Res Function(CharactersPageDto) _then;

/// Create a copy of CharactersPageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? info = null,Object? results = null,}) {
  return _then(_self.copyWith(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as InfoDto,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<CharacterDto>,
  ));
}
/// Create a copy of CharactersPageDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoDtoCopyWith<$Res> get info {
  
  return $InfoDtoCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// Adds pattern-matching-related methods to [CharactersPageDto].
extension CharactersPageDtoPatterns on CharactersPageDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharactersPageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharactersPageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharactersPageDto value)  $default,){
final _that = this;
switch (_that) {
case _CharactersPageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharactersPageDto value)?  $default,){
final _that = this;
switch (_that) {
case _CharactersPageDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( InfoDto info,  List<CharacterDto> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharactersPageDto() when $default != null:
return $default(_that.info,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( InfoDto info,  List<CharacterDto> results)  $default,) {final _that = this;
switch (_that) {
case _CharactersPageDto():
return $default(_that.info,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( InfoDto info,  List<CharacterDto> results)?  $default,) {final _that = this;
switch (_that) {
case _CharactersPageDto() when $default != null:
return $default(_that.info,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CharactersPageDto implements CharactersPageDto {
  const _CharactersPageDto({required this.info, required final  List<CharacterDto> results}): _results = results;
  factory _CharactersPageDto.fromJson(Map<String, dynamic> json) => _$CharactersPageDtoFromJson(json);

@override final  InfoDto info;
 final  List<CharacterDto> _results;
@override List<CharacterDto> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of CharactersPageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharactersPageDtoCopyWith<_CharactersPageDto> get copyWith => __$CharactersPageDtoCopyWithImpl<_CharactersPageDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CharactersPageDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharactersPageDto&&(identical(other.info, info) || other.info == info)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,info,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'CharactersPageDto(info: $info, results: $results)';
}


}

/// @nodoc
abstract mixin class _$CharactersPageDtoCopyWith<$Res> implements $CharactersPageDtoCopyWith<$Res> {
  factory _$CharactersPageDtoCopyWith(_CharactersPageDto value, $Res Function(_CharactersPageDto) _then) = __$CharactersPageDtoCopyWithImpl;
@override @useResult
$Res call({
 InfoDto info, List<CharacterDto> results
});


@override $InfoDtoCopyWith<$Res> get info;

}
/// @nodoc
class __$CharactersPageDtoCopyWithImpl<$Res>
    implements _$CharactersPageDtoCopyWith<$Res> {
  __$CharactersPageDtoCopyWithImpl(this._self, this._then);

  final _CharactersPageDto _self;
  final $Res Function(_CharactersPageDto) _then;

/// Create a copy of CharactersPageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? info = null,Object? results = null,}) {
  return _then(_CharactersPageDto(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as InfoDto,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<CharacterDto>,
  ));
}

/// Create a copy of CharactersPageDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoDtoCopyWith<$Res> get info {
  
  return $InfoDtoCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// @nodoc
mixin _$InfoDto {

 int get count; int get pages; String? get next; String? get prev;
/// Create a copy of InfoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InfoDtoCopyWith<InfoDto> get copyWith => _$InfoDtoCopyWithImpl<InfoDto>(this as InfoDto, _$identity);

  /// Serializes this InfoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InfoDto&&(identical(other.count, count) || other.count == count)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.next, next) || other.next == next)&&(identical(other.prev, prev) || other.prev == prev));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,pages,next,prev);

@override
String toString() {
  return 'InfoDto(count: $count, pages: $pages, next: $next, prev: $prev)';
}


}

/// @nodoc
abstract mixin class $InfoDtoCopyWith<$Res>  {
  factory $InfoDtoCopyWith(InfoDto value, $Res Function(InfoDto) _then) = _$InfoDtoCopyWithImpl;
@useResult
$Res call({
 int count, int pages, String? next, String? prev
});




}
/// @nodoc
class _$InfoDtoCopyWithImpl<$Res>
    implements $InfoDtoCopyWith<$Res> {
  _$InfoDtoCopyWithImpl(this._self, this._then);

  final InfoDto _self;
  final $Res Function(InfoDto) _then;

/// Create a copy of InfoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? pages = null,Object? next = freezed,Object? prev = freezed,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,prev: freezed == prev ? _self.prev : prev // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InfoDto].
extension InfoDtoPatterns on InfoDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InfoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InfoDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InfoDto value)  $default,){
final _that = this;
switch (_that) {
case _InfoDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InfoDto value)?  $default,){
final _that = this;
switch (_that) {
case _InfoDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  int pages,  String? next,  String? prev)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InfoDto() when $default != null:
return $default(_that.count,_that.pages,_that.next,_that.prev);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  int pages,  String? next,  String? prev)  $default,) {final _that = this;
switch (_that) {
case _InfoDto():
return $default(_that.count,_that.pages,_that.next,_that.prev);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  int pages,  String? next,  String? prev)?  $default,) {final _that = this;
switch (_that) {
case _InfoDto() when $default != null:
return $default(_that.count,_that.pages,_that.next,_that.prev);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InfoDto implements InfoDto {
  const _InfoDto({required this.count, required this.pages, this.next, this.prev});
  factory _InfoDto.fromJson(Map<String, dynamic> json) => _$InfoDtoFromJson(json);

@override final  int count;
@override final  int pages;
@override final  String? next;
@override final  String? prev;

/// Create a copy of InfoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InfoDtoCopyWith<_InfoDto> get copyWith => __$InfoDtoCopyWithImpl<_InfoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InfoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InfoDto&&(identical(other.count, count) || other.count == count)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.next, next) || other.next == next)&&(identical(other.prev, prev) || other.prev == prev));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,pages,next,prev);

@override
String toString() {
  return 'InfoDto(count: $count, pages: $pages, next: $next, prev: $prev)';
}


}

/// @nodoc
abstract mixin class _$InfoDtoCopyWith<$Res> implements $InfoDtoCopyWith<$Res> {
  factory _$InfoDtoCopyWith(_InfoDto value, $Res Function(_InfoDto) _then) = __$InfoDtoCopyWithImpl;
@override @useResult
$Res call({
 int count, int pages, String? next, String? prev
});




}
/// @nodoc
class __$InfoDtoCopyWithImpl<$Res>
    implements _$InfoDtoCopyWith<$Res> {
  __$InfoDtoCopyWithImpl(this._self, this._then);

  final _InfoDto _self;
  final $Res Function(_InfoDto) _then;

/// Create a copy of InfoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? pages = null,Object? next = freezed,Object? prev = freezed,}) {
  return _then(_InfoDto(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,prev: freezed == prev ? _self.prev : prev // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
