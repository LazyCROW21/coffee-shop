import 'package:coffee_shop/models/bill.dart';
import 'package:flutter/material.dart';

class BillListTile extends StatelessWidget {
  final Bill _bill;
  const BillListTile(this._bill, {super.key});

  double get getTotal {
    double total = 0;
    for (var element in _bill.items) {
      total += element.qty * (element.item.price ?? 0);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('#1012121'),
              Text(_bill.orderDateTime.toString())
            ],
          ),
          const Divider(),
          Text(
            'Total: Rs. $getTotal',
            textAlign: TextAlign.end,
          ),
          const Divider(),
          ..._bill.items
              .map((e) => ListTile(
                    leading: const Icon(Icons.ac_unit),
                    title: Text(e.item.title ?? ''),
                    subtitle:
                        Text('Price: Rs. ${e.item.price} | Qty: ${e.qty}'),
                    trailing: Text(
                      'SubTotal:\n ${(e.item.price ?? 0) * e.qty}',
                      maxLines: 2,
                      textAlign: TextAlign.end,
                    ),
                  ))
              .toList(),

          // ListTile(
          //   leading: Icon(Icons.ac_unit),
          //   title: Text('Product 2'),
          //   subtitle: Text('Price: Rs. 200 | Qyt: 2'),
          //   trailing: Text(
          //     'SubTotal:\n 400',
          //     maxLines: 2,
          //     textAlign: TextAlign.end,
          //   ),
          // )
        ],
      ),
    );
  }
}
