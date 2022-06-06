import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Laundry APP"),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const Center(
              child: Text(
                "welcome! Please LogIn to your account to make Orders",
                style: TextStyle(fontSize: 16),
              ),
            ),
       
            Column(
              children: const [
                Image(
                  image: AssetImage("./cloth.jpg"),
                ),
                Text(
                  "Data",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Image(
                  image: AssetImage("./image1.jpg"),
                  width: 100,
                ),
                Image(
                  image: AssetImage("./image2.jpg"),
                  width: 100,
                ),
              ],
            ),

            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        context.go('/logIn');
                      },
                      child: const Text("LogIn")),
                  ElevatedButton(
                      onPressed: () {
                        context.go('/signUp');
                      },
                      child: const Text(("Sign Up")))
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        key: const Key("drawer"),
        child: ListView(
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(color: Colors.teal),
                child: Column(
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage("./profile.jpg"),
                      radius: 60,
                    ),
                    Text(
                      "Login In to proceed...",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                )),
            const DrawerList(),
          ],
        ),
      ),
    );
  }
}

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              tileColor: Colors.grey,
              title: const Text("Home"),
              onTap: () {
                context.go('/');
              },
            ),
            // ListTile(
            //   tileColor: Colors.grey,
            //   title: const Text("Order"),
            //   onTap: () {
            //     context.go('/order');
            //   },
            // ),
            ListTile(
              tileColor: Colors.grey,
              title: const Text("Log in"),
              onTap: () {
                context.go('/logIn');
              },
            ),
            ListTile(
              tileColor: Colors.grey,
              title: const Text("Sign Up"),
              onTap: () {
                context.go('/signup');
              },
            ),
          ],
        ));
  }
}
