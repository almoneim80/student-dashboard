import 'package:flutter/material.dart';
import 'package:studenthomework/Classes/HomePage.dart';
import 'package:studenthomework/Classes/Details.dart';
import 'package:studenthomework/Classes/Attendance.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
              padding: EdgeInsets.only(left: 20.0),
              child: Text('Hi , Nawal.',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            ),
            const SizedBox(height: 5.0,),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10.0), // Adjust top padding
              child: Text('Welcome to your class.',style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color.fromRGBO(255, 204, 0, 1)),),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExpansionTile(
                    title: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: Text(
                        'Today s Classes',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),// Title of the first dropdown
                    trailing: CustomArrowIcon(), // Custom arrow icon
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue, // Background color for the circle avatar
                          child: Text(
                            'M', // Initial letter of the item's name
                            style: TextStyle(
                              color: Colors.white, // Color of the text
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Mathematics', // Name of the item
                            ),
                            Text(
                              '10:00 AM', // Time of the item
                            ),
                          ],
                        ),// Specific timing of the first item
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20), // Adjust padding as needed
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue, // Background color for the circle avatar
                          child: Text(
                            'P', // Initial letter of the item's name
                            style: TextStyle(
                              color: Colors.white, // Color of the text
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Physics', // Name of the item
                            ),
                            Text(
                              '10:00 AM', // Time of the item
                            ),
                          ],
                        ),
                      ),

                       ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue, // Background color for the circle avatar
                          child: Text(
                            'B', // Initial letter of the item's name
                            style: TextStyle(
                              color: Colors.white, // Color of the text
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Biology', // Name of the item
                            ),
                            Text(
                              '10:00 AM', // Time of the item
                            ),
                          ],
                        ), // Specific timing of the first item
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue, // Background color for the circle avatar
                          child: Text(
                            'G', // Initial letter of the item's name
                            style: TextStyle(
                              color: Colors.white, // Color of the text
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Geography', // Name of the item
                            ),
                            Text(
                              '10:00 AM', // Time of the item
                            ),
                          ],
                        ), // Specific timing of the first item
                      ),
                    ],
                  ),

                  ExpansionTile(
                    title: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Attendance()),
                        );
                      },
                      child:Text(
                        'Check Your Attendance',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    trailing: CustomArrowIcon(),
                  ),

                    ExpansionTile(
                      title: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Details()),
                          );
                        },
                        child:Text(
                        'Class details',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      ),
                      trailing: CustomArrowIcon(),
                    ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomArrowIcon extends StatelessWidget {
  const CustomArrowIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      child: CustomPaint(
        painter: _CustomArrowPainter(),
      ),
    );
  }
}

class _CustomArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black // Color of the arrow
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width, size.height / 2)
      ..lineTo(0, 0)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
