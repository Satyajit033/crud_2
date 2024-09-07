
import 'package:crud_2/HomeScreen.dart';
import 'package:crud_2/RestClient.dart';
import 'package:flutter/material.dart';

class CreateProductScreen extends StatefulWidget {

  const CreateProductScreen({Key? key}) : super(key: key);

  @override
  State<CreateProductScreen> createState() => _CreateScreenProductState();
}

class _CreateScreenProductState extends State<CreateProductScreen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  bool isLoading = false;

  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _productCodeTEController = TextEditingController();
  final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();

  Map<String,String>FormValues = {};

  AddedToFormValues(){
    FormValues.addAll({
      "Img":_imageTEController.text.toString(),
      "ProductCode":_productCodeTEController.text.toString(),
      "ProductName":_nameTEController.text.toString(),
      "Qty":_quantityTEController.text.toString(),
      "TotalPrice":_totalPriceTEController.text.toString(),
      "UnitPrice":_priceTEController.text.toString(),

    });
    setState(() {
    });
  }

  addProduct() async {
    isLoading = true;
    if(mounted){
      setState(() {
      });
    }
   await ProductPostRequest(FormValues);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context)=>const HomeScreen()),
          (Route route)=>false,
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.green,
        title: const Text(
          "Create Product",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body:isLoading?(
          const Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green)
            ),
          )
      ): SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formState,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameTEController,
                  decoration: const InputDecoration(
                    hintText: "Product Name",
                  ),
                  cursorColor: Colors.green,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your product name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _priceTEController,
                  decoration: const InputDecoration(hintText: "Unit Price"),
                  cursorColor: Colors.green,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter unit price';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _quantityTEController,
                  decoration: const InputDecoration(hintText: "Qty"),
                  cursorColor: Colors.green,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter quantity';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _totalPriceTEController,
                  decoration: const InputDecoration(hintText: "Total Price"),
                  cursorColor: Colors.green,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter total price';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _productCodeTEController,
                  decoration: const InputDecoration(hintText: "Product Code"),
                  cursorColor: Colors.green,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your product code';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _imageTEController,
                  decoration: const InputDecoration(hintText: "Image"),
                  cursorColor: Colors.green,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter an image link';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formState.currentState!.validate()) {
                        AddedToFormValues();
                        addProduct();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      elevation: 10,
                      padding: const EdgeInsets.fromLTRB(10, 17, 10, 17),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
