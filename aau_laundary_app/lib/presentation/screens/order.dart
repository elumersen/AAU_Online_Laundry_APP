import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  const Order({ Key? key }) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  
    var clothes = {
    'T-SHIRT':0,
    'JACKET':0,
    'TROUSER':0,
    "Sweater":0,
    "Blanket":0
  };
  var price = 4.99;
  var totalCost =0.0;


  @override
  Widget build(BuildContext context) {
    // print(clothes.keys.toList()[0] );
    return Scaffold(
      appBar: AppBar(title: Text("Make Your Laundary Order"),centerTitle: true,),
      body: ListView(
        
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Select Clothes For Wash", style: TextStyle(fontWeight: FontWeight.bold),),
                Text("Total Cost: ${totalCost.round()} ETB",style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            scrollDirection: Axis.vertical,
            itemBuilder: (context,index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                height: 120,
                width: double.infinity,
                child: Card(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image(
                        image:NetworkImage("data:image/jpeg;base64,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"))
                        ),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${clothes.keys.toList()[index]}"),
                                  Text(
                                    "${price} ETB",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),
                                  
                                  )
                                ],
                              ),
                              // Text("Choose Button")
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      child:Icon(
                                        Icons.add,
                                        color: Colors.black,
                                        ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,  
                                        shape:const CircleBorder()
                                        ),
                                      onPressed: (){
                                          setState(() {
                                            totalCost = totalCost + price;
                                           clothes[clothes.keys.toList()[index]]=clothes[clothes.keys.toList()[index]]! + 1;
                                        }
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 5),
                                      child: Text("${clothes.values.toList()[index]}"),
                                    ),
                                    ElevatedButton(
                                      child:Icon(
                                        Icons.remove,
                                        color: Colors.black,
                                        ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shape:const CircleBorder()
                                        ),
                                      onPressed: (){
                                        if(clothes[clothes.keys.toList()[index]]! >= 1){
                                             setState(() {
                                               totalCost = totalCost - price;
                                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("minu pressed")));
                                               if(totalCost < 0){
                                                 totalCost=0;

                                               }
                                               clothes[clothes.keys.toList()[index]]=clothes[clothes.keys.toList()[index]]! - 1;
                                        }
                                        );
                                        }
                            
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          ),
          ElevatedButton(onPressed: (){}, child: Text("Submit Order"))
        ],
      )
      
    );
  }
}