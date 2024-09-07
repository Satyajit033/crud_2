import 'package:crud_2/CreateProductScreen.dart';
import 'package:crud_2/RestClient.dart';
import 'package:crud_2/UpdateProductScreen.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List ProductList=[];
  bool isLoading = false;

  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData() async {
    isLoading = true;
    var callingResponse = await ProductGetRequest();
    setState(() {
      ProductList = callingResponse;
      isLoading = false;
    });
  }

  DeleteProduct(id)async{
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Delete!",style: TextStyle(color: Colors.red,fontSize: 23,fontWeight: FontWeight.w500),),
            content: const Text("once delete,you can not get it back",style: TextStyle(fontSize: 17),),
            actions: [
              ElevatedButton(onPressed: () async {
                Navigator.pop(context);
                setState(() {
                isLoading=true;
                });
                await ProductDeleteRequest(id);
                await CallData();
              }, child: const Text("Yes",style: TextStyle(color: Colors.red),)),
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text("No",style: TextStyle(color: Colors.green),))
            ],
          );
        }
    );
  }


  GoToUpdate(context,productItem){
    Navigator.push(context,
        MaterialPageRoute(
            builder: (builder)=>
                UpdateProductScreen(productItem)
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Product List",style: TextStyle(color: Colors.white),),
      ),

      body: isLoading?(
          const Center(
            child: CircularProgressIndicator(
              valueColor:
                AlwaysStoppedAnimation<Color>(Colors.green)
             ),
          )
      ): ListView.separated(
        itemCount: ProductList.length,
        itemBuilder: (context,index){
          return ListTile(
            contentPadding: const EdgeInsets.all(10),
            subtitle: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 65,
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Product Name : ${ProductList[index]["ProductName"]}",style: const TextStyle(fontSize:17,fontWeight: FontWeight.bold)),
                    Text("Product Code : ${ProductList[index]["ProductCode"]}",style: const TextStyle(fontSize:16)),
                    Text("Unit Price : ${ProductList[index]["UnitPrice"]} BDT",style: const TextStyle(fontSize:16)),
                    Text("Quantity : ${ProductList[index]["Qty"]}",style: const TextStyle(fontSize:16)),
                    Text("Total Price : ${ProductList[index]["TotalPrice"]} BDT",style:const TextStyle(fontSize: 16),),

                  ],
                ), ),
                const Expanded(child: SizedBox(),flex: 15,),
               // Spacer(),
                Expanded(
                  flex: 20,
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){
                      GoToUpdate(context,ProductList[index]);
                    }, child:const Icon(Icons.edit,color: Colors.green,)),
                    const SizedBox(height: 4,),
                    ElevatedButton(onPressed: (){
                      DeleteProduct(ProductList[index]["_id"]);
                     }, child:const Icon(Icons.delete,color: Colors.red,)),
                    ],
                  ),
                )
              ],
            ),


            leading: Image.network(
                ProductList[index]['Img'],
                width: 32,
                height: 32,
                fit: BoxFit.fill,
                errorBuilder: (context, obj, stackTrace) {
                  return const Icon(
                    Icons.image,
                    size: 32 ,
                  );
                }
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(color: Colors.green);
        },
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateProductScreen()));
          },
          backgroundColor: Colors.green,
          shape: const CircleBorder(),
          child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
