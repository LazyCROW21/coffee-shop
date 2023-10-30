import 'dart:math';

import 'package:coffee_shop/models/menu_item.dart';
import 'package:coffee_shop/view_models/menu_list/menu_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuItemPage extends StatefulWidget {
  final int? id;
  const MenuItemPage(this.id, {super.key});

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
  void initState() {
    if (widget.id != null) {
      MenuItem updateItem =
          BlocProvider.of<MenuListBloc>(context).state.menuItems.firstWhere(
                (element) => element.id == widget.id,
                orElse: () => MenuItem(id: -1),
              );
      if (updateItem.id != -1) {
        _titleInput.text = updateItem.title ?? '';
        _descriptionInput.text = updateItem.description ?? '';
        _priceInput.text = updateItem.price?.toString() ?? '';
        _stockInput.text = updateItem.stock?.toString() ?? '';
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _titleInput.dispose();
    _descriptionInput.dispose();
    _priceInput.dispose();
    _stockInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.id != null ? 'Update Item' : 'Add Item'),
        ),
        backgroundColor: Colors.pink[50],
        body: SingleChildScrollView(
          child: Form(
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(64)),
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
                        filled: true,
                        hintText: 'Title',
                        fillColor: Colors.white),
                    controller: _titleInput,
                    validator: (String? s) {
                      if (s == null || s.isEmpty) return 'Titile is required';
                      return null;
                    },
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
                        filled: true,
                        hintText: 'Price',
                        fillColor: Colors.white),
                    controller: _priceInput,
                    validator: (String? s) {
                      if (s == null || s.isEmpty) return 'Price is required';
                      if (double.tryParse(s) == null)
                        return 'Invalid price value';
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          filled: true,
                          hintText: 'Stock',
                          fillColor: Colors.white),
                      controller: _stockInput,
                      validator: (String? s) {
                        if (s == null || s.isEmpty) return 'Stock is required';
                        if (int.tryParse(s) == null)
                          return 'Invalid stock value';
                        return null;
                      }),
                  const SizedBox(
                    height: 18,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        bool? valid = _formKey.currentState?.validate();
                        if (valid == null || valid == false) {
                          return;
                        }
                        if (widget.id == null) {
                          BlocProvider.of<MenuListBloc>(context)
                              .add(AddMenuItem(
                                  menuItem: MenuItem(
                            id: 100 + Random().nextInt(100),
                            title: _titleInput.text,
                            description: _descriptionInput.text,
                            price: double.tryParse(_priceInput.text),
                            stock: int.tryParse(_stockInput.text),
                          )));
                        } else {
                          BlocProvider.of<MenuListBloc>(context)
                              .add(UpdateMenuItem(
                                  menuItem: MenuItem(
                            id: widget.id,
                            title: _titleInput.text,
                            description: _descriptionInput.text,
                            price: double.tryParse(_priceInput.text),
                            stock: int.tryParse(_stockInput.text),
                          )));
                        }
                        _formKey.currentState!.reset();
                        Navigator.of(context).pushReplacementNamed('/');
                      },
                      style: _saveButtonStyle,
                      child: Text(
                        'Save'.toUpperCase(),
                        style: const TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  Visibility(
                    visible: widget.id != null,
                    child: ElevatedButton(
                        onPressed: () {
                          _showConfirmDeleteDialog().then((value) {
                            if (value == true) Navigator.of(context).pop();
                          });
                        },
                        style: _deleteButtonStyle,
                        child: Text(
                          'Delete'.toUpperCase(),
                          style: const TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Future<bool?> _showConfirmDeleteDialog() async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop<bool>(false);
              },
            ),
            TextButton(
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                BlocProvider.of<MenuListBloc>(context)
                    .add(DeleteMenuItem(menuItem: MenuItem(id: widget.id)));
                Navigator.of(context).pop<bool>(true);
              },
            ),
          ],
        );
      },
    );
  }
}
