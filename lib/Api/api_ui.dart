
import 'package:flutter/material.dart';
import 'package:hello_world/Api/employeeModel.dart';
import '../ListViewDataPassing/list_data_passed_page.dart';

class ApiUi extends StatefulWidget {
  const ApiUi({Key? key}) : super(key: key);

  @override
  State<ApiUi> createState() => _ApiUiState();
}

class _ApiUiState extends State<ApiUi> {
  List<EmployeeModel>? employee;
  List<String>? employeeList;
  List<Map<String,dynamic>> list = [];

  String data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json Example"),
      ),
      // body: Center(
      //   child: GestureDetector(
      //     child: Text("Json Data Experiment $list"),
      //     onTap: () {
      //       setState(() {
      //         getEmployeeData();
      //         print("$data");
      //       });
      //     },
      //   ),
      // )

      body: createListView(),
    );
  }

 getEmployeeData() async {
    employee = await EmployeeModel.getDummyList();

    print("Employee:$employee");



    for (var item in employee!) {



      Map<String ,dynamic> map = {};

      map["name"] = item.name;
      map["surName"] = item.fitsName;
      map["employeeId"] = item.employeeId;
      map["dob"] = item.dob;
      map["address"] = item.address;
      map["aadhaar"] = item.aadhaar;

      list.add(map);



    }






  }

  Widget createListView() {
    getEmployeeData();
    // var listItems = list;
    var listView = ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          // return ListTile(
          //           //     title: Text(list[index]["name"]),
          //           //     textColor: Colors.blue,
          //           //     leading: Icon(Icons.phone),
          //           //     trailing: Icon(Icons.arrow_forward),
          //           //     subtitle: Text(list[index]["surName"]),
          //           //     onTap: () => goTOListDataPassedPage(context,list[index]["name"]));

          return Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            color: Colors.white,
            child: Column(
              
              children: <Widget>[
                Text("Name: ${list[index]["name"]}",textAlign: TextAlign.left,),
                SizedBox(height: 10,),
                Text("Fisrt Name:  ${list[index]["surName"]}",textAlign: TextAlign.left),
                SizedBox(height: 10,),
                Text("Emloyee Id: ${list[index]["employeeId"]}",textAlign: TextAlign.left),
                SizedBox(height: 10,),
                Text("dob: ${list[index]["dob"]}",textAlign: TextAlign.left),
                SizedBox(height: 10,),
                Text("Address: ${list[index]["address"]}",textAlign: TextAlign.left),
                SizedBox(height: 10,),
                Text("Aadhaar: ${list[index]["aadhaar"]}",textAlign: TextAlign.left),
                SizedBox(height: 30,),

              ],
            ),

          );

        });

    return listView;
  }

  goTOListDataPassedPage(BuildContext context , String listStr) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ListViewDataPassedPage(listStr)));
  }

}
