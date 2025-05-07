import 'package:countdown/src/ui/core/countdown/countdown_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({ super.key });

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
                  textStyle: TextStyle(fontSize: 30),
                  duration: Duration(minutes: 2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    ElevatedButton(
                      onPressed: () {}, 
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
                      onPressed: () {}, 
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