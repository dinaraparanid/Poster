// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RootState {
  UiState<Profile> get profileState => throw _privateConstructorUsedError;
  Tabs get selectedTab => throw _privateConstructorUsedError;
  RootEffect? get effect => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool get hasIncomingAnnouncements => throw _privateConstructorUsedError;

  /// Create a copy of RootState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RootStateCopyWith<RootState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RootStateCopyWith<$Res> {
  factory $RootStateCopyWith(RootState value, $Res Function(RootState) then) =
      _$RootStateCopyWithImpl<$Res, RootState>;
  @useResult
  $Res call(
      {UiState<Profile> profileState,
      Tabs selectedTab,
      RootEffect? effect,
      String? message,
      bool hasIncomingAnnouncements});

  $UiStateCopyWith<Profile, $Res> get profileState;
  $RootEffectCopyWith<$Res>? get effect;
}

/// @nodoc
class _$RootStateCopyWithImpl<$Res, $Val extends RootState>
    implements $RootStateCopyWith<$Res> {
  _$RootStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RootState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileState = null,
    Object? selectedTab = null,
    Object? effect = freezed,
    Object? message = freezed,
    Object? hasIncomingAnnouncements = null,
  }) {
    return _then(_value.copyWith(
      profileState: null == profileState
          ? _value.profileState
          : profileState // ignore: cast_nullable_to_non_nullable
              as UiState<Profile>,
      selectedTab: null == selectedTab
          ? _value.selectedTab
          : selectedTab // ignore: cast_nullable_to_non_nullable
              as Tabs,
      effect: freezed == effect
          ? _value.effect
          : effect // ignore: cast_nullable_to_non_nullable
              as RootEffect?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      hasIncomingAnnouncements: null == hasIncomingAnnouncements
          ? _value.hasIncomingAnnouncements
          : hasIncomingAnnouncements // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of RootState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UiStateCopyWith<Profile, $Res> get profileState {
    return $UiStateCopyWith<Profile, $Res>(_value.profileState, (value) {
      return _then(_value.copyWith(profileState: value) as $Val);
    });
  }

  /// Create a copy of RootState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RootEffectCopyWith<$Res>? get effect {
    if (_value.effect == null) {
      return null;
    }

    return $RootEffectCopyWith<$Res>(_value.effect!, (value) {
      return _then(_value.copyWith(effect: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RootStateImplCopyWith<$Res>
    implements $RootStateCopyWith<$Res> {
  factory _$$RootStateImplCopyWith(
          _$RootStateImpl value, $Res Function(_$RootStateImpl) then) =
      __$$RootStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UiState<Profile> profileState,
      Tabs selectedTab,
      RootEffect? effect,
      String? message,
      bool hasIncomingAnnouncements});

  @override
  $UiStateCopyWith<Profile, $Res> get profileState;
  @override
  $RootEffectCopyWith<$Res>? get effect;
}

/// @nodoc
class __$$RootStateImplCopyWithImpl<$Res>
    extends _$RootStateCopyWithImpl<$Res, _$RootStateImpl>
    implements _$$RootStateImplCopyWith<$Res> {
  __$$RootStateImplCopyWithImpl(
      _$RootStateImpl _value, $Res Function(_$RootStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RootState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileState = null,
    Object? selectedTab = null,
    Object? effect = freezed,
    Object? message = freezed,
    Object? hasIncomingAnnouncements = null,
  }) {
    return _then(_$RootStateImpl(
      profileState: null == profileState
          ? _value.profileState
          : profileState // ignore: cast_nullable_to_non_nullable
              as UiState<Profile>,
      selectedTab: null == selectedTab
          ? _value.selectedTab
          : selectedTab // ignore: cast_nullable_to_non_nullable
              as Tabs,
      effect: freezed == effect
          ? _value.effect
          : effect // ignore: cast_nullable_to_non_nullable
              as RootEffect?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      hasIncomingAnnouncements: null == hasIncomingAnnouncements
          ? _value.hasIncomingAnnouncements
          : hasIncomingAnnouncements // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RootStateImpl implements _RootState {
  const _$RootStateImpl(
      {required this.profileState,
      required this.selectedTab,
      this.effect,
      this.message,
      required this.hasIncomingAnnouncements});

  @override
  final UiState<Profile> profileState;
  @override
  final Tabs selectedTab;
  @override
  final RootEffect? effect;
  @override
  final String? message;
  @override
  final bool hasIncomingAnnouncements;

  @override
  String toString() {
    return 'RootState(profileState: $profileState, selectedTab: $selectedTab, effect: $effect, message: $message, hasIncomingAnnouncements: $hasIncomingAnnouncements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RootStateImpl &&
            (identical(other.profileState, profileState) ||
                other.profileState == profileState) &&
            (identical(other.selectedTab, selectedTab) ||
                other.selectedTab == selectedTab) &&
            (identical(other.effect, effect) || other.effect == effect) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(
                    other.hasIncomingAnnouncements, hasIncomingAnnouncements) ||
                other.hasIncomingAnnouncements == hasIncomingAnnouncements));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileState, selectedTab,
      effect, message, hasIncomingAnnouncements);

  /// Create a copy of RootState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RootStateImplCopyWith<_$RootStateImpl> get copyWith =>
      __$$RootStateImplCopyWithImpl<_$RootStateImpl>(this, _$identity);
}

abstract class _RootState implements RootState {
  const factory _RootState(
      {required final UiState<Profile> profileState,
      required final Tabs selectedTab,
      final RootEffect? effect,
      final String? message,
      required final bool hasIncomingAnnouncements}) = _$RootStateImpl;

  @override
  UiState<Profile> get profileState;
  @override
  Tabs get selectedTab;
  @override
  RootEffect? get effect;
  @override
  String? get message;
  @override
  bool get hasIncomingAnnouncements;

  /// Create a copy of RootState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RootStateImplCopyWith<_$RootStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
