import 'dart:ui';

import 'package:coffee_shop/components/bill_list_tile.dart';
import 'package:flutter/material.dart';

class BillsTab extends StatefulWidget {
  const BillsTab({super.key});

  @override
  State<BillsTab> createState() => _BillsTabState();
}

class _BillsTabState extends State<BillsTab> {
  final _bills = [1, 2, 3];
  final _searchInput = TextEditingController();
  bool _showFilters = false;

  @override
  void dispose() {
    _searchInput.dispose();
    super.dispose();
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
              child: ListView.separated(
                itemCount: _bills.length,
                itemBuilder: (itemBuilderContext, index) =>
                    const BillListTile(),
                separatorBuilder: (separatorBuilderContext, index) {
                  if (index != (_bills.length - 1)) {
                    return const Divider(
                      height: 32,
                      color: Colors.black87,
                    );
                  }
                  return const Divider(thickness: 0);
                },
              ),
            ),
          ]),
        ),
        _showFilters
            ? Positioned.fill(
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
                              color: Colors.white,
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text('Option 1'),
                                  Text('Option 2'),
                                  Text('Option 3'),
                                  Text('Option 4'),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ),
                ))
            : const SizedBox.shrink()
      ],
    );
  }
}
