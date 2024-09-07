import 'package:crud_2/HomeScreen.dart';
import 'package:crud_2/RestClient.dart';
import 'package:crud_2/Style.dart';
import 'package:crud_2/Utility.dart';
import 'package:flutter/material.dart';

class UpdateProductScreen extends StatefulWidget {

  final Map productItem;

  const UpdateProductScreen(this.productItem, {super.key});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {



  Map<String,String>FormValues = {
    "Img":"",
    "ProductCode":"",
    "ProductName":"",
    "Qty":"",
    "TotalPrice":"",
    "UnitPrice":""
  };

  bool isLoading = false;


  @override
  void initState(){
    super.initState();
    setState(() {
      FormValues.update("Img", (value) => widget.productItem["Img"]);
      FormValues.update("ProductCode", (value) => widget.productItem["ProductCode"]);
      FormValues.update("ProductName", (value) => widget.productItem["ProductName"]);
      FormValues.update("Qty", (value) => widget.productItem["Qty"]);
      FormValues.update("TotalPrice", (value) => widget.productItem["TotalPrice"]);
      FormValues.update("UnitPrice", (value) => widget.productItem["UnitPrice"]);
    });
  }


  InputOnChange(Mapkey , textValue){
    setState(() {
      FormValues.update(Mapkey, (value) => textValue);
    });
  }

  // form validation >>>>>--------

  FormOnSubmit()async{


    if(FormValues['ProductName']!.isEmpty){
      ErrorToast("Product Name required");
    }
    else if(FormValues['ProductCode']!.isEmpty){
      ErrorToast("Product Code required");
    }
    else if(FormValues['Img']!.isEmpty){
      ErrorToast('Image link required');
    }
    else if(FormValues['UnitPrice']!.isEmpty){
      ErrorToast("Unit Price required");
    }
    else if(FormValues['TotalPrice']!.isEmpty){
      ErrorToast("Total Price required");
    }
    else if(FormValues['Qty']!.isEmpty){
      ErrorToast("Qty required");
    }
    else{
      setState(() {
        isLoading = true;
      });
      await ProductUpdateRequest(FormValues, widget.productItem['_id']);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context)=>const HomeScreen()),
            (Route route)=>false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.green,
        title: const Text("Update Product",style: TextStyle(color: Colors.white),),
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child:isLoading?(const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.green)),)):SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [

                    TextFormField(
                      initialValue: FormValues["ProductName"],
                      onChanged: (textValue){
                        InputOnChange("ProductName", textValue) ;
                      },decoration: AppInputDecoration("Product Name"),),

                    const SizedBox(height: 20,),

                    TextFormField(
                      initialValue: FormValues["ProductCode"],
                      onChanged: (textValue){
                        InputOnChange("ProductCode", textValue) ;
                      },decoration: AppInputDecoration("Product Code"),),

                    const SizedBox(height: 20,),

                    TextFormField(
                      initialValue: FormValues["Img"],
                      onChanged: (textValue){
                        InputOnChange("Img", textValue) ;
                      },decoration: AppInputDecoration("Product Image"),),

                    const SizedBox(height: 20,),

                    TextFormField(
                      initialValue: FormValues["UnitPrice"],
                      onChanged: (textValue){
                        InputOnChange("UnitPrice", textValue) ;
                      },decoration: AppInputDecoration("Unit Price"),),

                    const SizedBox(height: 20,),

                    TextFormField(
                      initialValue: FormValues["TotalPrice"],
                      onChanged: (textValue){
                        InputOnChange("TotalPrice", textValue) ;
                      },decoration: AppInputDecoration("Total Price"),),

                    const SizedBox(height: 20,),

                    TextFormField(
                      initialValue: FormValues["Qty"],
                      onChanged: (textValue){
                        InputOnChange("Qty", textValue) ;
                      },decoration: AppInputDecoration("Quantity"),),



                    const SizedBox(height: 30,),
                    SizedBox(
                      width: double.infinity,
                      child:ElevatedButton(onPressed: (){
                        FormOnSubmit();
                      },
                        style: ElevatedButtonStyle(),
                        child: Text("Save",style: ButtonTextStyle(),),
                      ),
                    )
                  ],
                )
            ),
          )
        ],
      ),
    );
  }
}
