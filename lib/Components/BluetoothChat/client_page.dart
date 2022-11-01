import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue/flutter_blue.dart' as blue;
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'dart:io' show Platform;

import 'package:permission_handler/permission_handler.dart';


// import 'package:flutter_blue/flutter_blue.dart' as blue;
// import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class ClientPage extends StatefulWidget {
  final bool start;
  final blue.BluetoothDevice? device;

  const ClientPage({super.key, this.start = true, this.device});


  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  TextEditingController meetCodeController = TextEditingController();
  bool meetFieldHasText = false;
  static const blueColor = Color(0xFF48618a);

  FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;
  BluetoothConnection? connection = null ;
  FlutterBlue _flutterBlue = FlutterBlue.instance;
  int _deviceState = 0;
  bool isDisconnecting = false;

  //Discovering the bluetooth devices
  StreamSubscription<BluetoothDiscoveryResult>? _streamSubscription;
  List<BluetoothDiscoveryResult> results =
  List<BluetoothDiscoveryResult>.empty(growable: true);
  bool isDiscovering = false;

  //Flutter_React_Blue
  // Some state management stuff
  bool _foundDeviceWaitingToConnect = false;
  bool _scanStarted = false;
  bool _connected = false;

// Bluetooth related variables
  late DiscoveredDevice _ubiqueDevice;
  final flutterReactiveBle = FlutterReactiveBle();
  late StreamSubscription<DiscoveredDevice> _scanStream;
  late QualifiedCharacteristic _rxCharacteristic;
// These are the UUIDs of your device
  final Uuid serviceUuid = Uuid.parse("75C276C3-8F97-20BC-A143-B354244886D4");
  final Uuid characteristicUuid = Uuid.parse("6ACF4F08-CC9D-D495-6B41-AA7E60C4E8A6");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Join a meeting",
            style: TextStyle(color: Colors.black, fontSize: 24)),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness:
              Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
        actions: [
          GestureDetector(
            onTap: () {
              _startScan();
            },
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Text(
                "Join",
                style: TextStyle(
                  color: meetFieldHasText ? blueColor : Colors.grey,
                ),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                  "Enter a meeting nickname or the code provided by the meeting organizer")),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TextFormField(
              onChanged: (text) {
                if (text.isNotEmpty) {
                  setState(() {
                    meetFieldHasText = true;
                  });
                } else {
                  setState(() {
                    meetFieldHasText = false;
                  });
                }
              },
              controller: meetCodeController,
              style: TextStyle(color: Colors.black.withOpacity(0.9)),
              decoration: InputDecoration(
                hintText: "  Example: mymeeting or hello google",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          )
        ],
      ),
    );
  }

  discoverBluetoothDevice() {}

  // void _startDiscovery() {
  //   print("Discovery started.......");
  //   _streamSubscription =
  //       FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
  //         setState(() {
  //           final existingIndex = results.indexWhere(
  //                   (element) => element.device.address == r.device.address);
  //           if (existingIndex >= 0)
  //             results[existingIndex] = r;
  //           else
  //             results.add(r);
  //         });
  //       });
  //
  //   _streamSubscription!.onDone(() {
  //     print("Discovery ended...");
  //
  //     setState(()  {
  //       for(var item in results) {
  //         print("Name: ${item.device.name}");
  //         print("address: ${item.device.address}");
  //         print("type: ${item.device.type}");
  //         print("isBonded: ${item.device.isBonded}");
  //         print("isConnected: ${item.device.isConnected}");
  //         print("isConnected: ${meetCodeController.text.toString()}");
  //
  //
  //         if(item.device.name == meetCodeController.text.toString().trim()) {
  //           print("Your device ${meetCodeController.text.toString()} successfully found");
  //           _bluetooth.bondDeviceAtAddress(item.device.address).then((value) => _bluetooth.connect(item.device));
  //
  //         }
  //
  //
  //
  //
  //       }
  //       print("Results:${results}");
  //       isDiscovering = false;
  //     });
  //   });
  //
  //
  //
  // }

  _startDiscovery() async {

    FlutterBlue flutterBlue = FlutterBlue.instance;
    flutterBlue.startScan(timeout: Duration(seconds: 4));
// // Listen to scan results
//     var subscription = flutterBlue.scanResults.listen((results) async {
//       for (ScanResult r in results) {
//         print("Name: ${r.device.name}");
//         print("ID: ${r.device.id}");
//         print("Type: ${r.device.type}");
//         if(r.device.name != meetCodeController.text.toString()){
//           // Connect to the device
//           await r.device.connect();
//
//           // Disconnect from device
//           // r.device.disconnect();
//         }
//       }
//     });
//     flutterBlue.stopScan();

    // flutterBlue.scanResults.listen((List<ScanResult> results) {
    //   for (ScanResult result in results) {
    //     print("Name:${result.device.name}");
    //     print("Address:${result.device.id}");
    //     print("Type:${result.device.type}");
    //
    //
    //     if (result.device.name != "Colorfit Pro 3") {
    //       print("Hello Ramesh Boyee");
    //       _connectDevice(result.device);
    //       flutterBlue.stopScan();
    //     }
    //   }
    // });

    flutterBlue.startScan();


  }

  void _connectDevice(blue.BluetoothDevice device) async {
    _flutterBlue.stopScan();
    try {
      await device.connect();
    } catch (e) {
      if (e != 'already_connected') {
        throw e;
      }
    } finally {
      List<BluetoothService> services = await device.discoverServices();
      _getLEDChar(services);

    }
  }


  bool _getLEDChar(List<BluetoothService> services) {
    BluetoothCharacteristic _ledChar;
    var _myService = "bb89ad38-c3a8-4e49-8c9f-b15573ee9a70";
    var _myChar = "a404a877-90d8-44ae-af73-92a17ede3d11";
    for (BluetoothService s in services) {
      if (s.uuid.toString() == _myService) {
        var characteristics = s.characteristics;
        for (BluetoothCharacteristic c in characteristics) {
          if (c.uuid.toString() == _myChar) {
            _ledChar = c;
            return true;
          }
        }
      }
    }
    return false;
  }



  void _startScan() async {
// Platform permissions handling stuff


    bool permGranted = false;
    setState(() {
      _scanStarted = true;
    });

    if(await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if(status.isGranted) {
        permGranted = true;
      } else if(status.isDenied) {
        permGranted = false;
        Map<Permission,PermissionStatus> status = await[
          Permission.location,
        ].request();
      } else if(status.isPermanentlyDenied) {
        permGranted = false;
        openAppSettings();
      }

    }



// Main scanning logic happens here ⤵️
    if (permGranted) {
      _scanStream = flutterReactiveBle
          .scanForDevices(withServices: [serviceUuid]).listen((device) {

            print(device.id);
        // Change this string to what you defined in Zephyr
        if (device.name == 'UBIQUE') {
          setState(() {
            _ubiqueDevice = device;
            _foundDeviceWaitingToConnect = true;
          });
        }
      });
    }
  }









}
