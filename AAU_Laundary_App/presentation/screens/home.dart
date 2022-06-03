import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
        appBar: AppBar(title: const Text("Laundary"),),
    body: Container(
    padding:const EdgeInsets.all(15),
    margin:const EdgeInsets.all(15),
    
     child:Column(
     children: [const Text("wellcome"),
       Row(mainAxisAlignment: MainAxisAlignment.end, 
       children: [
       
      ElevatedButton(
        key:const Key("order") ,
        onPressed: (){
          GoRouter.of(context).go('/order');
       },
       child: const Text("ORDER"),      
      ),
      
      
       ]
       ),
       
        Column(
          children:const [ 
             
               Image(
                image: AssetImage("stock_cloth.jpg"),),      
      
            Text("data",
              ),
          ],
        ),
    
     const SizedBox(
       height:15,
     ),
      Expanded(child: 
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:const [
          Image(image: AssetImage("img1.jpg"),width: 100,),
          Image(image: AssetImage("img2.jpg"),width: 100,),
        ],
      ),
      ),

      const SizedBox(
        height:40,
      ),

      Expanded(child: 
          Container(padding: const EdgeInsets.only(bottom: 30),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {
                  context.go('/login');
                }, 
                child: const Text("Login")),
                ElevatedButton(onPressed: () {
                  context.go('/signup');
                }, 
                child: const Text(("Sign Up")))
              ],
            ),
          )
        )
    
    ],

   ),
   ),
   drawer: Drawer(
     key: const Key("drawer"),
     child:ListView(
        children:  [
          DrawerHeader(decoration: const BoxDecoration(color:Colors.teal),
            child: Column(children:const [ CircleAvatar(
            backgroundImage:AssetImage("assets/img2.jpg"),
            radius: 60,
            
            ),
            Text("AAU Laundary APP",style: TextStyle(fontSize: 10),)
             ],)
             ),
           const DrawerList(),
          
             ],
      ) ,

   ),
    );    
  
  }
}

class DrawerList extends StatelessWidget {
  const DrawerList({ Key? key }) : super(key: key);

  
  
  @override
  Widget build(BuildContext context) {
    return Container(padding:const EdgeInsets.all(10),
      child:Column(
        children: [

          ListTile(
          tileColor: Colors.grey,         
            title: const Text("Home"),
            onTap:() {
              GoRouter.of(context).go('/');
            } ,    
          ),
           ListTile(
           tileColor:Colors.grey,
            title: const Text("Contact"),
            onTap:() {
              GoRouter.of(context).go('contact');
            } ,    
          ),
          
           ListTile(
           tileColor: Colors.grey,
            title: const Text("About Us"),
            onTap:() {
             GoRouter.of(context).go('/about');
              } ,    
          ),
           ListTile(
           tileColor: Colors.grey,
            title: const Text("Dashboard"),
            onTap:() {
              GoRouter.of(context).go('/dashboard');
            } ,  

          ),
          
           ListTile(
           tileColor: Colors.grey,
            title: const Text("Order"),
            onTap:() {
             GoRouter.of(context).go('/order');
            } ,    
          ),
           ListTile(
           tileColor: Colors.grey,
            title: const Text("Log in"),
            onTap:() {
              GoRouter.of(context).go('/login');
            } ,    
          ),
           ListTile(
           tileColor: Colors.grey,
            title: const Text("Sign Up"),
            onTap:() {
              GoRouter.of(context).go('/signup');
            } ,    
          ),
        ],

      )
      
    );
  }
}
