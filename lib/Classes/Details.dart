import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

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
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(Icons.notifications, color: Colors.black, size: 30,),
                onPressed: (){},
              ),
            ),
          ],
          backgroundColor: Colors.white10,
          title: const Text(
            'Hudurk',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
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
            Row(
              children: [
                const SizedBox(width: 20,),
                SizedBox(
                  height: 70,
                  width: 70,
                  child: Image.asset('assets/logoStudent.jpeg'),
                ),
                const SizedBox(width: 20,),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Nawal dafer', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Text('444337@gmail.com', style: TextStyle(fontSize: 16),),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text('Class Details.',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            ),
            const SizedBox(height: 10,),
            sharedContainer('Mathematics', '09:30 am', 'assets/mathematics.png' , Colors.brown),
            const SizedBox(height: 10,),
            sharedContainer('Physics', '10:40 am', 'assets/physics.png', Colors.blueGrey),
            const SizedBox(height: 10,),
            sharedContainer('Biology', '11:45 am', 'assets/biology.png', Colors.yellowAccent),
            const SizedBox(height: 10,),
            sharedContainer('Geography', '12:10 pm', 'assets/geography.png', Colors.red),
          ],
        ),
      ),
    );
  }

  Widget sharedContainer(String title, String time, String imagePath, Color circleColor) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: circleColor, // Use the specified circle color
            ),
            child: Center(
              child: Text(
                title[0], // Use the first letter of the title as the text
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Description here', // Replace with the actual description
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            time,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
