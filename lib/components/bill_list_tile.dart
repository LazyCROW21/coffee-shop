import 'package:flutter/material.dart';

class BillListTile extends StatelessWidget {
  const BillListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('#1012121'), Text('26 Oct, 2023')],
          ),
          Divider(),
          Text(
            'Total: Rs. 5000',
            textAlign: TextAlign.end,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('Product 1'),
            subtitle: Text('Price: Rs. 100 | Qty: 3'),
            trailing: Text(
              'SubTotal:\n 300',
              maxLines: 2,
              textAlign: TextAlign.end,
            ),
          ),
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('Product 1'),
            subtitle: Text('Price: Rs. 100 | Qty: 3'),
            trailing: Text(
              'SubTotal:\n 300',
              maxLines: 2,
              textAlign: TextAlign.end,
            ),
          ),
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('Product 2'),
            subtitle: Text('Price: Rs. 200 | Qyt: 2'),
            trailing: Text(
              'SubTotal:\n 400',
              maxLines: 2,
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }
}
