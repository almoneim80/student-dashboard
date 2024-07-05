import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedOption = 1;

  Future<void> scanBarcode() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#FF0000',
      'إلغاء',
      true,
      ScanMode.DEFAULT,
    );

    if (!mounted) return;

    if (barcodeScanRes != '-1') {
      // Scanning was successful
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 24),
                SizedBox(width: 8),
                Text('Success'),
              ],
            ),
            content: Text('Barcode Result: $barcodeScanRes'),
            actions: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue, // Button background color
                  borderRadius: BorderRadius.circular(8), // Button border radius
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop(); // Return to the previous screen
                  },
                  child: Text(
                    'Return to Home Screen',
                    style: TextStyle(color: Colors.white), // Button text color
                  ),
                ),
              ),
            ],
          );
        },
      );
    } else {
      // Scanning failed
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              children: [
                Icon(Icons.error, color: Colors.red, size: 24), // Different icon for failure
                SizedBox(width: 8),
                Text('Failure'),
              ],
            ),
            content: Text('Barcode scanning failed. Please try again.'),
            actions: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue, // Button background color
                  borderRadius: BorderRadius.circular(8), // Button border radius
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    scanBarcode(); // Retry the barcode scanning
                  },
                  child: Text(
                    'Try Again',
                    style: TextStyle(color: Colors.white), // Button text color
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0), // Set the desired height
        child: AppBar(
          elevation: 0.0,
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: IconButton(
                icon: const Icon(Icons.notifications, color: Colors.black, size: 30,),
                onPressed: (){},
              ),
            ),
          ],
          backgroundColor: Colors.white10,
          title: const Center(
            child: Text(
              'Hudurk',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          leading: const Icon(Icons.settings, color: Colors.black, size: 30,),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50,),
            SizedBox(
              child: Row(
                children: [
                  const SizedBox(width: 20,),
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset('assets/logoStudent.jpeg'),
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const[
                      Text('Nawal dafer', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Text('444337@gmail.com', style: TextStyle(fontSize: 16),),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text('Today`s Classes',style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
            ),
            const SizedBox(height: 10,),

            sharedContainer('Mathematics', '09:30 am', 'assets/mathematics.png', 1, selectedOption),
            const SizedBox(height: 10,),

            sharedContainer('Physics', '10:40 am', 'assets/physics.png', 2, selectedOption),
            const SizedBox(height: 10,),

            sharedContainer('Biology', '11:45 am', 'assets/biology.png', 3, selectedOption),
            const SizedBox(height: 10,),

            sharedContainer('Geography', '12:10 pm', 'assets/geography.png', 4, selectedOption),
            const SizedBox(height: 30,),

            sharedButton('Mark Attendance'),
            const SizedBox(height: 20,),

            sharedButton('back'),
            const SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }

  Widget sharedButton(String btnString){
    return Center(
      child: Container(
        height: 40,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(12, 28, 68, 1.0),
              Color.fromRGBO(23, 32, 61, 0.3)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        child: ElevatedButton(
          onPressed: () {
            if (btnString == 'Mark Attendance') {
              scanBarcode();
            } else if (btnString == 'back') {
              Navigator.pop(context); // Navigate back to the previous screen
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            btnString,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget sharedContainer(String title, String details, String img, int value, int groupValue){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            const SizedBox(height: 4,),
            Row(
              children: [
                const SizedBox(width: 10,),
                SizedBox(
                    width: 55,
                    height: 55,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Image.asset(img, fit: BoxFit.cover,),
                    )
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontSize: 18,),),
                      Text(details, style: const TextStyle(fontSize: 14, color: Colors.black38,),),
                    ],
                  ),
                ),
                Transform.scale(
                  scale: 1.3,
                  child: Radio(
                    value: value,
                    groupValue: selectedOption,
                    activeColor: Colors.red,
                    onChanged: (newValue) {
                      setState(() {
                        selectedOption = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
