import 'package:kodeklubben/main.dart';
import 'package:flutter/material.dart';
import 'package:kodeklubben/models/cart.dart';
import 'package:scoped_model/scoped_model.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(title: Text('Kalender')),
      body: ScopedModelDescendant<Cart>(
        builder: (_, child, model) {
          return Column(
            children: [
              Text(
                'Kalender',
                style: TextStyle(fontSize: 24),
              ),
              FlatButton(
                child: Text('Tilbake'),
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                      ctx, MaterialPageRoute(builder: (ctx) => MyApp()));
                },
              )
            ],
          );
        },
      ),
    );
  }
}
