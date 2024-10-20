import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/pages/login/spit_login.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final TextEditingController accountController = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  String? errorMessage;
  String? sessionToken;
  bool sessionExists = false;

  final counter = 0.obs;

  @override
  void onInit() {
    getSessionKey();
    super.onInit();
  }

  Future<void> saveSessionKey(String cookie) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('sessionCookie', cookie);
    sessionToken = cookie;
    sessionExists = true;
  }

  Future<String?> getSessionKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sessionToken = prefs.getString('sessionCookie');
    sessionExists = sessionToken != null;
    return sessionToken;
  }

  Future<void> deleteSessionKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('sessionCookie');
    sessionToken = null;
    sessionExists = false;
    pinController.clear();
    Get.offAll(() => SpitLogin());
  }

  String? validateAccountNumber(String? value) {
    if (value == null || value.isEmpty) {
      errorMessage = 'Please enter your account number';
    } else if (value.replaceAll(' ', '').length != 16) {
      errorMessage = 'Account number must be 16 digits';
    } else {
      errorMessage = null;
    }
    return errorMessage;
  }

  String? validatePin(String? value) {
    if (value == null || value.isEmpty) {
      errorMessage = 'Please enter your PIN';
    } else if (value.length != 4) {
      errorMessage = 'PIN must be 4 digits';
    } else {
      errorMessage = null;
    }
    return errorMessage;
  }

  Timer? cooldownTimer;
  DateTime? _lastAttemptTime;
  static const int cooldownDurationMinutes = 3;


  bool _isInCooldown() {
    if (_lastAttemptTime == null) return false;

    final now = DateTime.now();
    final durationSinceLastAttempt = now.difference(_lastAttemptTime!);
    return durationSinceLastAttempt <
        const Duration(minutes: cooldownDurationMinutes);
  }

  void _startCooldown() {
    _lastAttemptTime = DateTime.now();
    cooldownTimer =
        Timer(const Duration(minutes: cooldownDurationMinutes), () {});
  }

  @override
  void onClose() {
    accountController.dispose();
    pinController.dispose();
    super.onClose();
  }
}
