import 'dart:ui';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:namodevawfh/main.dart';

class AwesomeMusicNotification {
  static Future<void> initialize() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'music_player_channel',
          channelName: 'Music Player Notifications',
          channelDescription: 'Notification channel for music player controls',
          defaultColor: Colors.amber,
          importance: NotificationImportance.High,
          channelShowBadge: true,
          playSound: false,
          enableVibration: false,
          enableLights: false,
        ),
      ],
    );

    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }

    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );
  }

  static Future<void> showMusicNotification({
    required String title,
    required String artist,
    required bool isPlaying,
    required String imageUrl,
    required Duration progress,
    required Duration total,
  }) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'music_player_channel',
          title: title,
          body: artist,
          category: NotificationCategory.Transport,
          notificationLayout: NotificationLayout.MediaPlayer,
          largeIcon: imageUrl, // URL or local asset path for album art
          autoDismissible: false,
          showWhen: true,
          displayOnBackground: true,
          displayOnForeground: true,
          wakeUpScreen: false,
          fullScreenIntent: false,
          criticalAlert: false,
          roundedBigPicture: true,
          progress: _calculateProgress(progress, total)
          // Return double for progress
          ),
      // actionButtons: [
      //   NotificationActionButton(
      //     key: 'PREVIOUS',
      //     label: 'Previous',
      //     actionType: ActionType.Default,
      //     icon: 'resource://drawable/ic_previous',
      //     enabled: true,
      //   ),
      //   NotificationActionButton(
      //     key: isPlaying ? 'PAUSE' : 'PLAY',
      //     label: isPlaying ? 'Pause' : 'Play',
      //     actionType: ActionType.Default,
      //     icon: 'resource://drawable/${isPlaying ? "ic_pause" : "ic_play"}',
      //     enabled: true,
      //   ),
      //   NotificationActionButton(
      //     key: 'NEXT',
      //     label: 'Next',
      //     actionType: ActionType.Default,
      //     icon: 'resource://drawable/ic_next',
      //     enabled: true,
      //   ),
      // ],
    );
  }

  static double _calculateProgress(Duration progress, Duration total) {
    if (total.inMilliseconds <= 0)
      return 0.0; // Total duration should be greater than 0
    if (progress.inMilliseconds < 0)
      return 0.0; // Ensure progress is non-negative
    return ((progress.inMilliseconds / total.inMilliseconds) * 100)
        .clamp(0, 100)
        .toDouble();
  }

  static Future<void> cancelNotification() async {
    await AwesomeNotifications().cancel(1);
  }
}

class NotificationController {
  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Handle the button actions
    switch (receivedAction.buttonKeyPressed) {
      case 'PLAY':
        // Handle play action
        break;
      case 'PAUSE':
        // Handle pause action
        break;
      case 'NEXT':
        // Handle next track action
        break;
      case 'PREVIOUS':
        // Handle previous track action
        break;
    }

    // Navigate if needed
    MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil(
      '/notification-page',
      (route) => (route.settings.name != '/notification-page') || route.isFirst,
      arguments: receivedAction,
    );
  }
}
