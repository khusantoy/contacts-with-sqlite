import 'package:flutter/material.dart';

class ContactInfoScreen extends StatelessWidget {
  const ContactInfoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Column(
        children: [
          const CircleAvatar(
            radius: 80,
            child: Text(
              "X",
              style: TextStyle(fontSize: 80, color: Colors.white),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              "Xusanboy Tursunov",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.3,
                child: const Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      child: Icon(Icons.phone),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Call",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.3,
                child: const Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      child: Icon(Icons.message),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Message",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.3,
                child: const Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      child: Icon(Icons.video_call),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Set up",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 130,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withAlpha(100),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 18, bottom: 10),
                    child: Text(
                      "Contact info",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.call),
                    title: Text("+998 97 232 07 18"),
                    subtitle: Text("Mobile"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
