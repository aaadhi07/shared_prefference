import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
TextEditingController text = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  String enteredText = text.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: () async {

             // Obtain shared preferences.
             final SharedPreferences prefs = await SharedPreferences.getInstance();
             // Save an String value to 'action' key.
             await prefs.setString('action', text.text);
        
            }, child: Text("Save")),
            SizedBox(height: 10),
             ElevatedButton(onPressed: () async {

            // Obtain shared preferences.
             final SharedPreferences prefs = await SharedPreferences.getInstance();
             // Try reading data from the 'action' key. If it doesn't exist, returns null.
             final String? action = prefs.getString('action');
             print(action);
             setState(() {});     
             }, child: Text("Get")),
             SizedBox(height: 10),
             Text(text.text),
          ],
        ),
      ),
    );
  }
}