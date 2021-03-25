// Module Import
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

// Local Import
import 'package:exam_app_teachers/components/appbar.dart';

String name;
String email;
String id;
String token;

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future getLocalData() async {
    SharedPreferences _homeScreenPrefs = await SharedPreferences.getInstance();
    // Fetching Values from ShredPreference and store them in Local Variable.
    setState(() {
      name = _homeScreenPrefs.get('NAME');
      email = _homeScreenPrefs.getString('EMAIL');
      id = _homeScreenPrefs.get('ID');
      token = _homeScreenPrefs.get('TOKEN');
    });
    // getQuestion();
  }

  void initState() {
    super.initState();
    getLocalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarComponent(),
      ),
      body: FutureBuilder(
        future: getQuestion(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return ListView.builder(
              itemCount: 20,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text("Subject Name"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Exam Name"),
                          SizedBox(width: 50),
                          Text("Full Marks"),
                          SizedBox(width: 50),
                          Text("Status"),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("BCA"),
                          SizedBox(width: 50),
                          Text("SEM"),
                        ],
                      ),
                    ],
                  ),
                  isThreeLine: true,
                  trailing: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black12,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {},
                    ),
                  ),
                  onTap: () {
                    print(i);
                  },
                );
              },
            );
        },
      ),
    );
  }

  Future getQuestion() async {
    List.generate(20, (index) => index);

    // var url =
    //     "https://online-examination-revised.herokuapp.com/teacherapi/seeQuestionPaper";

    // SharedPreferences _prefs = await SharedPreferences.getInstance();

    // var req = await http.post(url, body: {
    //   'subjectCode': "BCAN 501",
    //   'subjectName': "JAVA",
    //   'examinationName': "CA",
    // }, headers: {
    //   'authorization': _prefs.getString('TOKEN'),
    // });

    // print(req.body);
    // var res = await convert.jsonDecode(req.body);
    // if (req.statusCode == 200) {
    //   print(res['data']);
    //   Navigator.of(context).pushNamed('/viewPaper', arguments: {
    //     res["data"],
    //   });
    // }

    // return res["data"];
    return List;
  }
}
