// ignore_for_file: use_build_context_synchronously

import 'package:boumedstore/models/product_model.dart';
import 'package:boumedstore/services/update_product.dart';
import 'package:boumedstore/views/home.view.dart';
import 'package:boumedstore/widgets/custom_botton.dart';
import 'package:boumedstore/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class UpdateProductView extends StatefulWidget {
  const UpdateProductView({super.key, required this.product});
  static String id = 'update product view';
  final ProductModel product;
  @override
  State<UpdateProductView> createState() => _UpdateProductViewState();
}

class _UpdateProductViewState extends State<UpdateProductView> {
  final TextEditingController title = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController rate = TextEditingController();
  final TextEditingController description = TextEditingController();
  late bool isloading;

  @override
  void initState() {
    isloading = false;

    title.text = widget.product.title;
    price.text = widget.product.price.toString();
    rate.text = widget.product.ratingModel.rate.toString();
    description.text = widget.product.desc;
    super.initState();
  }

  @override
  void dispose() {
    title.dispose();
    price.dispose();
    rate.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ProductModel productModel =
    //     ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.product.title,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/pexels-bhylviu-14464685.jpg'),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: isloading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      hintText: 'Title',
                      mycontroller: title,
                    ),
                    CustomTextFormField(
                      hintText: 'Price',
                      mycontroller: price,
                      keyboardType: TextInputType.number,
                    ),
                    CustomTextFormField(
                      hintText: 'Description',
                      mycontroller: description,
                    ),
                    CustomBotton(
                      text: 'Update',
                      onTap: () async {
                        try {
                          await updateProduct(widget.product);
                          isloading = true;
                          setState(() {});
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('success')));
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              HomeView.id, (route) => false);

                          isloading = false;
                          setState(() {});
                        } catch (e) {
                          isloading = false;
                          setState(() {});
                          print("error is : $e");
                        }
                      },
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel productModel) async {
    await UpdateProductService().updateProduct(
      id: productModel.id.toString(),
      title: title.text,
      price: price.text,
      desc: description.text,
      image: productModel.image,
      category: productModel.category,
      rate: productModel.ratingModel.rate,
      count: productModel.ratingModel.count,
    );
  }
}
