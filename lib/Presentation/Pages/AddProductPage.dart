import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furnizone/Constant/MyColors.dart';
import 'package:furnizone/Constant/SizeConfg.dart';
import 'package:furnizone/Data/Models/addProductModel.dart';
import 'package:furnizone/Logic/AdminCubit/admin_cubit.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({super.key});
  static const id = '/AddProductPage';

  final List<String> categories = [
    "Chair",
    "Bed",
    "Lamp",
    "Table",
    "Sofa",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {
        if (state is SuccessAddProduct) {
          BlocProvider.of<AdminCubit>(context).clearAllField();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Product Successfuly added!"),
            ),
          );
        } else if (state is FailedAddProduct) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              "Add new product",
              style: TextStyle(
                color: Mycolors.mainColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Select type of product:",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 57, 96),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    dropdownColor: Mycolors.thirdColor,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Mycolors.thirdColor,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                    ),
                    value:
                        BlocProvider.of<AdminCubit>(context).selectedCategory,
                    items: categories.map((category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(
                          category,
                          style: const TextStyle(color: Mycolors.mainColor),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      //!change selectedcategory here
                      BlocProvider.of<AdminCubit>(context)
                          .changeCategory(newCategory: value!);
                    },
                    hint: const Text(
                      "Select a category",
                      style: TextStyle(color: Mycolors.mainColor),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Add Photo:",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 57, 96),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Mycolors.thirdColor,
                          image: BlocProvider.of<AdminCubit>(context)
                                      .productImage ==
                                  null
                              ? null
                              : DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                    File(BlocProvider.of<AdminCubit>(context)
                                        .productImage!
                                        .path),
                                  ),
                                ),
                        ),
                        width: SizeConfig.width,
                        height: 160,
                      ),
                      Positioned(
                        left: -1,
                        bottom: -5,
                        child: CircleAvatar(
                          backgroundColor: Color(0xFF4A628A),
                          child: IconButton(
                            onPressed: () {
                              ImagePicker()
                                  .pickImage(source: ImageSource.gallery)
                                  .then((value) =>
                                      BlocProvider.of<AdminCubit>(context)
                                          .uploadProductImage(value!));
                            },
                            icon: Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Select remaining details:",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 57, 96),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller:
                        BlocProvider.of<AdminCubit>(context).nameController,
                    decoration: InputDecoration(
                      fillColor: Mycolors.thirdColor,
                      filled: true,
                      labelText: "Name",
                      labelStyle: const TextStyle(color: Mycolors.mainColor),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: BlocProvider.of<AdminCubit>(context)
                        .descriptionController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      fillColor: Mycolors.thirdColor,
                      filled: true,
                      labelText: "Description",
                      labelStyle: const TextStyle(color: Mycolors.mainColor),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller:
                        BlocProvider.of<AdminCubit>(context).priceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Mycolors.thirdColor,
                      filled: true,
                      labelText: "Price",
                      labelStyle: const TextStyle(color: Mycolors.mainColor),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: BlocProvider.of<AdminCubit>(context)
                        .stockQuantityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Mycolors.thirdColor,
                      filled: true,
                      labelText: "Stock Quantity",
                      labelStyle: const TextStyle(color: Mycolors.mainColor),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[300],
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 12),
                        ),
                        onPressed: () {
                          //! Clear all fields here
                          BlocProvider.of<AdminCubit>(context).clearAllField();
                        },
                        child: const Text("Discard"),
                      ),
                      state is LoadingAddProduct
                          ? Center(child: CircularProgressIndicator())
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[300],
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 12),
                              ),
                              onPressed: () async {
                                //! Handle product addition logic here
                                if (BlocProvider.of<AdminCubit>(context)
                                    .formIsValid()) {
                                  var newproduct =
                                      await BlocProvider.of<AdminCubit>(context)
                                          .addProduct();
                                  BlocProvider.of<AdminCubit>(context)
                                      .addProductImage(newproduct.productId);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text("Please fill all the fields."),
                                    ),
                                  );
                                }
                              },
                              child: const Text("Add Product"),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
