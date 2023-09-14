import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/auth.dart';

class OTPLoginScreen extends StatefulWidget {
  @override
  _OTPLoginScreenState createState() => _OTPLoginScreenState();
}

class _OTPLoginScreenState extends State<OTPLoginScreen> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final Auth _auth = Get.find<Auth>();

  void _sendOTP() async {
    final phoneNumber = phoneNumberController.text.trim();
    if (phoneNumber.isNotEmpty) {
      try {
        await _auth.mobileOtp(phoneno: phoneNumber);
        Get.to(OTPVerificationScreen(phoneNumber));
      } catch (e) {
        print('Error sending OTP: $e');
      }
    } else {
      print('Phone number is empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => Auth());
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
            ),
            ElevatedButton(
              onPressed: _sendOTP,
              child: Text('Send OTP'),
            ),
          ],
        ),
      ),
    );
  }
}

class OTPVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  OTPVerificationScreen(this.phoneNumber);

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController otpController = TextEditingController();
  final Auth _auth = Get.find<Auth>();

  void _verifyOTP() async {
    final otp = otpController.text.trim();
    if (otp.isNotEmpty) {
      try {
        print('Before accessing user: ${_auth.currentUser}');
        final user = _auth.currentUser; // Get the current user
        print('After accessing user: $user');
        if (user != null) {
          await _auth.verifyMobileOtp(otp: otp);
          await _auth.handleGetContact();
        } else {
          print('User is not authenticated');
        }
      } catch (e) {
        print('Error verifying OTP: $e');
      }
    } else {
      print('OTP is empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Enter OTP sent to ${widget.phoneNumber}'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'OTP'),
              ),
            ),
            ElevatedButton(
              onPressed: _verifyOTP,
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
