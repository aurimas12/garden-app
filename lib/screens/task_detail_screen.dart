import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskDetailScreen extends StatefulWidget {
  final Task task;
  final Function(String mood) onComplete;

  const TaskDetailScreen({
    super.key,
    required this.task,
    required this.onComplete,
  });

  @override
  _TaskDetailScreenState createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  int _currentStep = 0;
  String? _selectedMood;

  @override
  void initState() {
    super.initState();
    _selectedMood = widget.task.mood ?? '';
  }

  void _nextStep() {
    setState(() {
      if (_currentStep < widget.task.descriptions.length - 1) {
        _currentStep++;
      } else {
        widget.task.done = true;
        widget.task.mood = _selectedMood;
        widget.onComplete(_selectedMood ?? '');
        Navigator.pop(context);
      }
    });
  }

  Widget _buildMoodSelector() {
    return Column(
      children: [
        const Text(
          'Kokia šiandien Tavo nuotaika?',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              ['😊', '😐', '😢'].map((mood) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedMood = mood;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _selectedMood == mood
                              ? Colors.green[300]
                              : Colors.grey[300],
                    ),
                    child: Text(mood, style: const TextStyle(fontSize: 26)),
                  ),
                );
              }).toList(),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildDescriptionStep() {
    final description = widget.task.descriptions[_currentStep];
    final isMoodStep = description.toLowerCase().contains('nuotaika');

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF8FFF4),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 40),
              if (_currentStep == 0 && isMoodStep) _buildMoodSelector(),
              if (!(_currentStep == 0 && isMoodStep))
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    description,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed:
                    (isMoodStep && _currentStep == 0 && _selectedMood == '')
                        ? null
                        : _nextStep,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: Text(
                  _currentStep == widget.task.descriptions.length - 1
                      ? 'Užbaigti'
                      : 'Toliau',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F5EC),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.task.text),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.85,
          ),
          child: _buildDescriptionStep(),
        ),
      ),
    );
  }
}
