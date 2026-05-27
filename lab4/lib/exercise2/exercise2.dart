import 'package:flutter/material.dart';

enum MonkeyGender { Male, Female, Other }

class Exercise2 extends StatefulWidget {
  const Exercise2({super.key});

  @override
  State<Exercise2> createState() => _Exercise2();
}

class _Exercise2 extends State<Exercise2> {
  double _sliderValue = 50;
  bool _isSwitchActive = false;
  MonkeyGender? _selectedGenre;
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2004),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),

      appBar: AppBar(
        title: const Text('Exercise 2 - Input Widgets (Slider, Switch, RadioListTile, Pickers)'),
        backgroundColor: Colors.yellow,
        elevation: 0,
        foregroundColor: Colors.black,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text('Age (Slider)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Slider(
            value: _sliderValue,
            min: 1,
            max: 100,
            divisions: 100,
            label: _sliderValue.round().toString(),
            onChanged: (double value) {
              setState(() { _sliderValue = value; });
            },
          ),
          Center(child: Text('Current value: ${_sliderValue.round()}')),
          const SizedBox(height: 24),

          const Text('Active (Switch)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SwitchListTile(
            title: const Text('Is male?'),
            value: _isSwitchActive,
            onChanged: (bool value) {
              setState(() { _isSwitchActive = value; });
            },
          ),

          const SizedBox(height: 24),

          const Text('Gender (RadioListTile)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          RadioListTile<MonkeyGender>(
            title: const Text('Male'),
            value: MonkeyGender.Male,
            groupValue: _selectedGenre,
            onChanged: (MonkeyGender? value) {
              setState(() { _selectedGenre = value; });
            },
          ),
          RadioListTile<MonkeyGender>(
            title: const Text('Female'),
            value: MonkeyGender.Female,
            groupValue: _selectedGenre,
            onChanged: (MonkeyGender? value) {
              setState(() { _selectedGenre = value; });
            },
          ),
          const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Selected gender: ${_selectedGenre?.name ?? 'None'}',
              style: const TextStyle(color: Colors.black54),
            ),
          ),
          const SizedBox(height: 24),

          ElevatedButton(
            onPressed: () => _selectDate(context),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: Colors.grey.shade200,
              foregroundColor: Colors.indigo.shade300,
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text('Open Date Picker'),
          ),
          const SizedBox(height: 12),

          if (_selectedDate != null)
            Center(
              child: Text(
                'Selected Date: ${_selectedDate!.toLocal()}'.split(' ')[0],
                style: const TextStyle(color: Colors.black54),
              ),
            ),
        ],
      ),
    );
  }
}