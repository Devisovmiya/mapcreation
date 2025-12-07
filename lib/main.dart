import 'package:flutter/material.dart';
//import 'package:mapcreation/student_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Map<String, Map<String, dynamic>> students = {
    '001': {
      'name': 'Alice',
      'age': 20,
      'grade': {'Math': 'A', 'Science': 'B', 'English': 'A'},
    },
    '002': {
      'name': 'Bob',
      'age': 22,
      'grade': {'Math': 'C', 'Science': 'A', 'English': 'B'},
    },
    '003': {
      'name': 'Charlie',
      'age': 21,
      'grade': {'Math': 'B', 'Science': 'C', 'English': 'A'},
    },
  };
  final rollnumctrl = TextEditingController();
  final namectrl = TextEditingController();
  final agectrl = TextEditingController();
  final mathctrl = TextEditingController();
  final sciencectrl = TextEditingController();
  final engctrl = TextEditingController();

  //------------ToAdd-------------
  void addStudent() {
    String rollnum = rollnumctrl.text;
    String name = namectrl.text;
    int age = int.parse(agectrl.text);
    String mathmark = mathctrl.text;
    String sciencemark = sciencectrl.text;
    String engmark = engctrl.text;

    if (rollnum.isNotEmpty &&
        name.isNotEmpty &&
        agectrl.text.isNotEmpty &&
        mathctrl.text.isNotEmpty &&
        sciencectrl.text.isNotEmpty &&
        engctrl.text.isNotEmpty) {
      setState(() {
        students[rollnum] = {
          'rollnum': rollnum,
          'name': name,
          'age': age,
          'grade': {
            'Math': mathmark,
            'Science': sciencemark,
            'English': engmark,
          },
        };
      });

      rollnumctrl.clear();
      namectrl.clear();
      agectrl.clear();
      mathctrl.clear();
      sciencectrl.clear();
      engctrl.clear();
    }
  }

  //----------------------ToDelete---------------
  void deleteStudent(String rollnum) {
    setState(() {
      students.remove(rollnum);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: const Text('Mark Register App'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: rollnumctrl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Roll Number',
                ),
              ),
              SizedBox(height: 10),

              TextField(
                controller: namectrl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter  Name',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: agectrl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Age',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: mathctrl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Mathsmark',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: sciencectrl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter ScienceMarks',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: engctrl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter English Marks',
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  addStudent();
                },
                child: Text('ADD To Record'),
              ),

              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final keys = students.keys.toList();
                    final rollnum = keys[index]; //to get key at index
                    final student = students[rollnum]!; //to get value at key
                    //final grade = (student['grade'] as Map<String, dynamic>? ) ?? {};
                    return ListTile(
                      title: Text('${student['name']} (Roll No: $rollnum)'),
                      subtitle: Text(
                        'Age: ${student['age']}  Grades: Math- ${student['grade']['Math']}  Science- ${student['grade']['Science']}  English- ${student['grade']['English']}',
                      ),

                      //---------deleteOption-----------
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => deleteStudent(rollnum),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: students.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
