// Module Import
import 'package:exam_app_teachers/components/ExamTabs/mcqTab.dart';
import 'package:exam_app_teachers/components/ExamTabs/satq.dart';
import 'package:flutter/material.dart';

//Local Import
import 'package:exam_app_teachers/components/formHeader.dart';

class CreateExam extends StatefulWidget {
  @override
  _CreateExamState createState() => _CreateExamState();
}

class _CreateExamState extends State<CreateExam> {
  int _index = 0;
  final pages = [
    Center(child: Text("Preview")),
    MCQTab(),
    SATQTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final Map teacher = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            children: [
              FormHeaderComponent(
                subName: teacher['subName'],
                subCode: teacher['subCode'],
                examName: teacher['examName'],
                fullMarks: teacher['fulMarks'],
                sem: teacher['sem'],
              ),
              SizedBox(height: 20),
              pages[_index],
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[50],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home_filled),
                    Text("Preview"),
                  ],
                ),
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outlined),
            activeIcon: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.deepPurple[50],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_box_rounded,
                    color: Colors.deepPurple,
                  ),
                  Text("MCQ Tab"),
                ],
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_snippet_outlined),
            activeIcon: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[50],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.text_snippet_rounded),
                    Text("SATQ Tab"),
                  ],
                ),
              ),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
