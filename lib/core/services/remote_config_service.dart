import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_config_service.freezed.dart';

class RemoteConfigService extends Cubit<RemoteConfigState> {
  RemoteConfigService() : super(const RemoteConfigState());

  static final _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> initialize() async {
    try {
      await _remoteConfig.ensureInitialized();
      await _remoteConfig.fetchAndActivate();

      _setConfigValues();

      _remoteConfig.onConfigUpdated.listen((event) async {
        await _remoteConfig.fetchAndActivate();
        _setConfigValues();
      });
    } catch (_) {}
  }

  void _setConfigValues() {
    emit(
      state.copyWith(
        landingPriceLevel: _remoteConfig.getInt(
          'landing_price_level',
        ),
        // shouldShowReminders: _remoteConfig.getBool(
        //   'reminders',
        // ),
        // shouldShowTeamsProgress: _remoteConfig.getBool(
        //   'teams_progress',
        // ),
        // shouldShowActiveRolePlay: _remoteConfig.getBool(
        //   'active_role_play',
        // ),
        // shouldShowUserManagement: _remoteConfig.getBool(
        //   'user_management',
        // ),
        // shouldShowMyComments: _remoteConfig.getBool(
        //   'my_comments',
        // ),
        // shouldShowChatSupport: _remoteConfig.getBool(
        //   'chat_support',
        // ),
        // shouldShowAllAvailableCourses: _remoteConfig.getBool(
        //   'all_available_courses',
        // ),
        // isMaintenanceMode: _remoteConfig.getBool(
        //   'maintenance_mode',
        // ),
        // maintenanceModeReason: _remoteConfig.getString(
        //   'maintenance_mode_reason',
        // ),
        // shouldShowCourseEnrollment: _remoteConfig.getBool(
        //   'course_enrollment',
        // ),
        // shouldShowGlobalSearch: _remoteConfig.getBool(
        //   'global_search',
        // ),
      ),
    );
  }
}

@freezed
class RemoteConfigState with _$RemoteConfigState {
  const factory RemoteConfigState({
    @Default(4) int landingPriceLevel,
    // @Default(true) bool shouldShowReminders,
    // @Default(true) bool shouldShowTeamsProgress,
    // @Default(true) bool shouldShowActiveRolePlay,
    // @Default(true) bool shouldShowUserManagement,
    // @Default(true) bool shouldShowMyComments,
    // @Default(true) bool shouldShowChatSupport,
    // @Default(false) bool shouldShowAllAvailableCourses,
    // @Default(false) bool isMaintenanceMode,
    // @Default('') String maintenanceModeReason,
    // @Default(true) bool shouldShowCourseEnrollment,
    // @Default(true) bool shouldShowGlobalSearch,
  }) = _RemoteConfigState;
}
