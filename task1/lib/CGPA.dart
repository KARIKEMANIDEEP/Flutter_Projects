import 'package:flutter/material.dart';

void main() {
  runApp(BTechResultApp());
}

class BTechResultApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'B.Tech Results',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, List<List<TextEditingController>>> marksControllers = {};

  double overallCGPA = 0.0;

  @override
  void initState() {
    super.initState();
    // Initialize controllers for 8 semesters and 4 subjects each
    for (int sem = 1; sem <= 8; sem++) {
      List<TextEditingController> subjectControllers = List.generate(
        4,
            (_) => TextEditingController(),
      );
      marksControllers["Semester $sem"] = [subjectControllers];
    }
  }

  void navigateToYear(int year) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => YearPage(year: year, marksControllers: marksControllers),
      ),
    );
  }

  void calculateOverallCGPA() {
    double total = 0;
    int count = 0;
    for (int sem = 1; sem <= 8; sem++) {
      var controllers = marksControllers["Semester $sem"]!.first;
      for (var controller in controllers) {
        if (controller.text.isNotEmpty) {
          total += double.tryParse(controller.text) ?? 0;
          count++;
        }
      }
    }

    setState(() {
      overallCGPA = count > 0 ? (total / count) / 10 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("B.Tech Result UI")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("Overall CGPA: ${overallCGPA.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => navigateToYear(1),
              child: const Text("First Year"),
            ),
            ElevatedButton(
              onPressed: () => navigateToYear(2),
              child: const Text("Second Year"),
            ),
            ElevatedButton(
              onPressed: () => navigateToYear(3),
              child: const Text("Third Year"),
            ),
            ElevatedButton(
              onPressed: () => navigateToYear(4),
              child: const Text("Fourth Year"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: calculateOverallCGPA,
              child: const Text("Calculate Overall CGPA"),
            ),
          ],
        ),
      ),
    );
  }
}

class YearPage extends StatelessWidget {
  final int year;
  final Map<String, List<List<TextEditingController>>> marksControllers;

  YearPage({required this.year, required this.marksControllers});

  @override
  Widget build(BuildContext context) {
    int startSem = (year - 1) * 2 + 1;
    int endSem = startSem + 1;

    return Scaffold(
      appBar: AppBar(title: Text("Year $year Semesters")),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          int semesterNumber = startSem + index;
          return SemesterInput(
            semester: semesterNumber,
            controllers: marksControllers["Semester $semesterNumber"]!.first,
          );
        },
      ),
    );
  }
}

class SemesterInput extends StatelessWidget {
  final int semester;
  final List<TextEditingController> controllers;

  SemesterInput({required this.semester, required this.controllers});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Semester $semester", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            for (int i = 0; i < 4; i++)
              TextField(
                controller: controllers[i],
                decoration: InputDecoration(
                    labelText: "Subject ${i + 1} Marks (out of 100)"),
                keyboardType: TextInputType.number,
              ),
          ],
        ),
      ),
    );
  }
}
