import 'package:flutter/material.dart';
import '../core/countdown/countdown.dart';

class HomeScreen extends StatefulWidget {


  const HomeScreen({ super.key });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late final CountdownController countDownController;
  var enableResendSMS = false;

  @override
  void initState() {
    countDownController = CountdownController(
      duration: Duration(seconds: 5), 
      onEnd: () {
        setState(() {
          enableResendSMS = true;
        });
      }
    );
    super.initState();
  }

  @override
  void dispose() {
    countDownController.dispose();
    super.dispose();
  }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
          appBar: AppBar(title: const Text('Home'),),
          body: SizedBox(
            width: double.maxFinite,
            child: Column(
              spacing: 10,
              children: [
                CountdownWidget(
                  controller: countDownController,
                  textStyle: TextStyle(fontSize: 30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        countDownController.restart();
                      }, 
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                      child: Text(
                        'Reset'
                      ),
                    ),
                    ElevatedButton(
                      onPressed: enableResendSMS ? () {
                        setState(() {
                          enableResendSMS = false;
                          countDownController.restart();
                        });
                      } : null, 
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                      child: Text(
                        'Resend SMS',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
       );
  }
}