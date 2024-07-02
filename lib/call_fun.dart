import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:firebase_auth/firebase_auth.dart';
class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID,required this.bol}) : super(key: key);
  final String callID;
  final bool bol;
  
  @override
  Widget build(BuildContext context) {
    final user=FirebaseAuth.instance.currentUser;
    return ZegoUIKitPrebuiltCall(
      appID:
          1013843535, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign:
          "a22ff6bbfc8525a669d22907a12ec0d52b6023d311615b58db5dd52a46f62267", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: user!.uid,
      userName: "> ${user.displayName}"?? '',
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: bol?ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall():ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
