import 'package:flutter/material.dart';
import 'package:hello_world/BootomNavigationBar/my_bootom_navigation_bar.dart';
import 'package:hello_world/CheckBox/my_check_box.dart';
import 'package:hello_world/Drawer/drawer_page.dart';
import 'package:hello_world/DropDownButton/drop_down_page.dart';
import 'package:hello_world/ImageWidget/image_widget_examples.dart';
import 'package:hello_world/RadioButtonAndListTile/my_radio_button.dart';
import 'package:hello_world/Screens/MyIcon.dart';
import 'package:hello_world/Screens/alert_dialoge_example.dart';
import 'package:hello_world/Screens/container_margin_padding.dart';
import 'package:hello_world/Screens/dynamic_list_view.dart';
import 'package:hello_world/Screens/my_first_page.dart';
import 'package:hello_world/Screens/my_page.dart';
import 'package:hello_world/Screens/text_button.dart';
import 'package:hello_world/Screens/row_widget.dart';
import 'package:hello_world/Screens/snack_bar.dart';
import 'package:hello_world/Screens/text_field_page.dart';
import 'package:hello_world/Screens/toast_message_example.dart';
import 'package:hello_world/SwithExample/my_switch.dart';
import 'package:hello_world/TabBar/tab_bar_page.dart';

import '../DataPassingBetweenTwoScreens/user_form.dart';
import '../SharedPreferences/shared_preferences.dart';
import '../StateFullWidgets/state_full_widget_example_one.dart';
import '../StateFullWidgets/stls_and_full_widget.dart';
import 'column_widget.dart';
import '../ListViewDataPassing/dynamic_list_view_data_passing.dart';
import 'floating_action_button.dart';
import 'list_view_example.dart';

class NavigatorExample extends StatelessWidget {
  const NavigatorExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Navigator Example"),
          centerTitle: true,
          leading: Icon(Icons.menu),
        ),
        body: Center(
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Colors.black)),
                    height: 40,
                    margin: EdgeInsets.all(10),
                    child: Center(child: (Text("My First Page"))),
                  ),
                  onTap: () => goToFirstScreen(context)
              ),
              
              GestureDetector(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Colors.black)),
                    margin: EdgeInsets.all(10),
                    child: Center(child: (Text("My Page"))),
                  ),
                  onTap: () => goToMyPage(context)
              ),
              
              GestureDetector(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Colors.black)),
                    margin: EdgeInsets.all(10),
                    child: Center(child: (Text("Raised Button Example"))),
                  ),
                  onTap: () => goToRaisedButtonExample(context)
              ),
              
              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: const EdgeInsets.all(10),
                  child: Center(child: (const Text("Icons Example"))),
                ),
                onTap: () => goToIconsExample(context),
              ),
              
              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(10),
                  child: Center(child: (Text("Text Field Example"))),
                ),
                onTap: () => goToTextFieldExample(context),
              ),
              
              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(10),
                  child: Center(child: (Text("Column Widget Example"))),
                ),
                onTap: ()=>goToColumnWidgetExample(context),
              ),
              
              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(10),
                  child: Center(child: (Text("Row Widget Example"))),
                ),
                onTap: () => goToRowWidgetExample(context),
              ),
              
              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(10),
                  child: Center(
                      child: (Text("Container, Margin, Padding Example"))),
                ),
                onTap: ()=>goToContainerPaddingMarginExample(context),
              ),
              
              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(10),
                  child:
                      Center(child: (Text("Floating Action Button Example"))),
                ),
                onTap: () => goToFloatingActionButtonExample(context),
              ),
              
              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(10),
                  child: Center(child: (Text("Snack Bar Example"))),
                ),
                onTap: () => goToSnackBarExample(context),
              ),
              
              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(10),
                  child: Center(child: (Text("Toast Message Example"))),
                ),
                onTap: ()=>goToToastMessageExample(context),
              ),
              
              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(10),
                  child: Center(child: (Text(" Alert Dialoge Example"))),
                ),
                onTap: () =>goToAlertDialogeExample(context),
              ),

              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(10),
                  child: Center(child: (Text("Navigator Data Passing"))),
                ),
                onTap: () =>goToNavigatorDataPassing(context),
              ),

              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(10),
                  child: Center(child: (Text("List View Page"))),
                ),
                onTap: () =>goToListViewPage(context),
              ),

              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(10),
                  child: Center(child: (Text("Dynamic List View Page"))),
                ),
                onTap: () =>goToDynamicListViewPage(context),
              ),


              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(10),
                  child: Center(child: (Text("Dynamic List View Data Passing"))),
                ),
                onTap: () =>goToDynamicListViewDataPassing(context),
              ),

              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(10),
                  child: Center(child: (Text("State Full Wiget Example One"))),
                ),
                onTap: () =>goToStateFullWidetOne(context),
              ),

              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(10),
                  child: Center(child: (Text("State Full VS State Less"))),
                ),
                onTap: () =>goToStateFullVsLessWidet(context),
              ),

              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(10),
                  child: Center(child: (Text("Image Widget Example"))),
                ),
                onTap: () =>goToImageWidget(context),
              ),

              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(10),
                  child: Center(child: (Text("Bottom Navigation Bar"))),
                ),
                onTap: () =>goToBottomNavigationBar(context),
              ),

              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(10),
                  child: Center(child: (Text("Tab Bar"))),
                ),
                onTap: () =>goToTabBar(context),
              ),

              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(10),
                  child: Center(child: (Text("Drawer Layout"))),
                ),
                onTap: () =>goToDrawerLayout(context),
              ),

              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(10),
                  child: Center(child: (Text("Check Box"))),
                ),
                onTap: () =>goToCheckBoxPage(context),
              ),

              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(10),
                  child: Center(child: (Text("Radio Button"))),
                ),
                onTap: () =>goToRadioButtonPage(context),
              ),

              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(10),
                  child: Center(child: (Text("Drop Down"))),
                ),
                onTap: () =>goToDropDownPage(context),
              ),

              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(10),
                  child: Center(child: (Text("Switch"))),
                ),
                onTap: () =>goToSwitchPage(context),
              ),

              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(10),
                  child: Center(child: (Text("Shared Preferences"))),
                ),
                onTap: () =>goToSharePreferencePage(context),
              ),

            ],
          ),
        ));
  }




  goToFirstScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MyFirstPage()));
  }

  goToMyPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MyPage()));
  }

  goToRaisedButtonExample(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RaisedButtonPage()));
  }

  goToIconsExample(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyIcon()));
  }

  goToTextFieldExample(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TextFieldPage()));
  }

  goToColumnWidgetExample(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ColoumnWidgetPage()));
  }

  goToRowWidgetExample(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RowWidgetPage()));
  }

  goToContainerPaddingMarginExample(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ContainerMarginPaddingPage()));
  }

  goToFloatingActionButtonExample(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const FlotingActionButtonPage()));
  }

  goToSnackBarExample(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SnackBarPage()));
  }

  goToToastMessageExample(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ToastMessageExample()));
  }

  goToAlertDialogeExample(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AlertDialogeExample()));
  }

  goToNavigatorDataPassing(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => userForm()));
  }

  goToListViewPage(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ListViewExample()));
  }

  goToDynamicListViewPage(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DynamicListViewExample()));
  }

  goToDynamicListViewDataPassing(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListViewDataPassingExample()));
  }

  goToStateFullWidetOne(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StateFullWidgetExampleOne()));
  }

  goToStateFullVsLessWidet(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StateLessAndFullWidget()));
  }

  goToImageWidget(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ImageWidgetExample()));
  }

  goToBottomNavigationBar(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyBottomNavigationBar()));
  }

  goToTabBar(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TabBarPage()));
  }

  goToDrawerLayout(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyDrawerPage()));
  }

  goToCheckBoxPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyCheckBoxPage()));
  }

  goToRadioButtonPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyRadioButtonPage()));
  }

  goToDropDownPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyDropDownPage()));
  }

  goToSwitchPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MySwitchPage()));
  }

  goToSharePreferencePage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MySharedPreferencePage()));
  }


}
