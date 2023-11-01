import 'dart:ui';

import 'package:coffee_shop/components/bill_list_tile.dart';
import 'package:coffee_shop/view_models/bill_list/bill_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillsTab extends StatefulWidget {
  const BillsTab({super.key});

  @override
  State<BillsTab> createState() => _BillsTabState();
}

class _BillsTabState extends State<BillsTab> {
  final _searchInput = TextEditingController();
  bool _showFilters = false;

  @override
  void dispose() {
    _searchInput.dispose();
    super.dispose();
  }

  void _selectDate(BuildContext context) async {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: TextField(
                    controller: _searchInput,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            _showFilters = true;
                          });
                        },
                        icon: const Icon(Icons.filter_list)))
              ],
            ),
            const Divider(),
            Expanded(
              child: BlocBuilder<BillListBloc, BillListState>(
                builder: (context, state) {
                  if (state.bills.isEmpty) {
                    return const Center(
                        child: Text(
                      'No bills found..',
                      style: TextStyle(
                          color: Colors.grey, fontStyle: FontStyle.italic),
                    ));
                  }
                  return ListView.separated(
                    itemCount: state.bills.length,
                    itemBuilder: (itemBuilderContext, index) =>
                        BillListTile(state.bills.elementAt(index)),
                    separatorBuilder: (separatorBuilderContext, index) {
                      if (index != (state.bills.length - 1)) {
                        return const Divider(
                          height: 32,
                          color: Colors.black87,
                        );
                      }
                      return const Divider(thickness: 0);
                    },
                  );
                },
              ),
            ),
          ]),
        ),
        Visibility(
          visible: _showFilters,
          child: Positioned.fill(
              bottom: 0,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: GestureDetector(
                  onTap: () => setState(() {
                    _showFilters = false;
                  }),
                  child: Container(
                    color: Colors.black12,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () => {},
                          child: Container(
                            color: const Color.fromARGB(255, 255, 246, 254),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  'Bill total range:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          isDense: true,
                                          border: OutlineInputBorder(),
                                          hintText: 'Min'),
                                    )),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                        child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          isDense: true,
                                          border: OutlineInputBorder(),
                                          hintText: 'Max'),
                                    )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                const Text(
                                  'Order date range:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        onTap: () => _selectDate(context),
                                        child: Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: const Text(
                                              '11:00 a.m. 21 Nov, 2023'),
                                        ),
                                      ),
                                    )),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                        child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        onTap: () => _selectDate(context),
                                        child: Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: const Text(
                                              '07:00 p.m. 21 Nov, 2023'),
                                        ),
                                      ),
                                    )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              _showFilters = false;
                                            });
                                          },
                                          child: const Text('Cancel')),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          style: const ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Colors.purple)),
                                          child: const Text(
                                            'Apply',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
              )),
        )
      ],
    );
  }
}
