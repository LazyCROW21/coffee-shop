import 'package:coffee_shop/models/item.dart';
import 'package:flutter/material.dart';

class MenuItemPage extends StatefulWidget {
  const MenuItemPage({super.key});

  @override
  State<MenuItemPage> createState() => _MenuItemPageState();
}

class _MenuItemPageState extends State<MenuItemPage> {
  final _menuItem = MenuItem();
  final _titleInput = TextEditingController();
  final _descriptionInput = TextEditingController();
  final _priceInput = TextEditingController();
  final _stockInput = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _saveButtonStyle = const ButtonStyle(
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)))),
    backgroundColor: MaterialStatePropertyAll(Colors.pink),
    padding: MaterialStatePropertyAll(EdgeInsets.all(16)),
  );

  final _deleteButtonStyle = const ButtonStyle(
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)))),
    backgroundColor: MaterialStatePropertyAll(Colors.red),
    padding: MaterialStatePropertyAll(EdgeInsets.all(16)),
  );

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _titleInput.dispose();
    _descriptionInput.dispose();
    _descriptionInput.dispose();
    _priceInput.dispose();
    _stockInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
      ),
      backgroundColor: Colors.pink[50],
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 128,
                  width: 128,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(64)),
                      color: Colors.white,
                      border: Border.all(color: Colors.black)),
                  child: ClipRRect(
                      child: Image.network(
                    _menuItem.imgUrl ?? '',
                    loadingBuilder: (context, child, loadingProgress) =>
                        const Icon(Icons.image),
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image),
                  )),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    filled: true, hintText: 'Title', fillColor: Colors.white),
                controller: _titleInput,
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                minLines: 2,
                maxLines: 4,
                decoration: const InputDecoration(
                    filled: true,
                    hintText: 'Description',
                    fillColor: Colors.white),
                controller: _descriptionInput,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    filled: true, hintText: 'Price', fillColor: Colors.white),
                controller: _priceInput,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    filled: true, hintText: 'Stock', fillColor: Colors.white),
                controller: _stockInput,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                  style: _saveButtonStyle,
                  child: Text(
                    'Save'.toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  )),
              const Divider(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                  style: _deleteButtonStyle,
                  child: Text(
                    'Delete'.toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
