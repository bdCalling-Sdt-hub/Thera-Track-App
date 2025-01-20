import 'package:flutter/material.dart';
import 'package:thera_track_app/utils/style.dart';

class AdvanceSettingsScreen extends StatefulWidget {
  @override
  _AdvanceSettingsScreenState createState() => _AdvanceSettingsScreenState();
}

class _AdvanceSettingsScreenState extends State<AdvanceSettingsScreen> {

  List<String> options = ['Animal', 'Human'];
  Map<String, bool> selectionMap = {
    'Animal': false,
    'Human': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advance Settings', style: AppStyles.fontSize16()),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [

            Expanded(
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  String option = options[index];
                  return CheckboxListTile(
                    title: Text(option),
                    value: selectionMap[option] ?? false,
                    onChanged: (bool? value) {
                      setState(() {
                        selectionMap[option] = value!;
                      });
                    },
                    activeColor: Colors.blue,
                    checkColor: Colors.white,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
