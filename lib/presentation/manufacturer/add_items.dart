// import 'package:flutter/material.dart';

// class AddProductPage extends StatefulWidget {
//   @override
//   _AddProductPageState createState() => _AddProductPageState();
// }

// class _AddProductPageState extends State<AddProductPage> {
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _descriptionController = TextEditingController();
//   TextEditingController _priceController = TextEditingController();
//   TextEditingController _quantityController = TextEditingController();
//   TextEditingController _categoryController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Product'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             TextFormField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Product Name'),
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               controller: _descriptionController,
//               decoration: InputDecoration(labelText: 'Description'),
//               maxLines: 3,
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               controller: _priceController,
//               decoration: InputDecoration(labelText: 'Price'),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               controller: _quantityController,
//               decoration: InputDecoration(labelText: 'Quantity'),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               controller: _categoryController,
//               decoration: InputDecoration(labelText: 'Category'),
//             ),
//             SizedBox(height: 32.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Add product logic goes here
//                 _addProduct();
//               },
//               child: Text('Add Product'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _addProduct() {
//     // Retrieve values from controllers and add product
//     String name = _nameController.text;
//     String description = _descriptionController.text;
//     double price = double.tryParse(_priceController.text) ?? 0.0;
//     int quantity = int.tryParse(_quantityController.text) ?? 0;
//     String category = _categoryController.text;

//     // Validate input (optional)

//     // Add logic to add the product to your database or backend
//     // You can use APIs or any other methods to communicate with your backend
//   }
// }
