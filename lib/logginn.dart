import 'package:flutter/cupertino.dart';
import 'package:kodeklubben/main.dart';
import 'package:flutter/material.dart';
import 'package:kodeklubben/models/cart.dart';
import 'package:scoped_model/scoped_model.dart';

class LoggInn extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(title: Text('Logg Inn/Registrer')),
      body: ScopedModelDescendant<Cart>(
        builder: (_, child, model) {
          return Column(
            children: [
              Text(
                'Du må enten registrere deg med Brukernavn og Passord, eller hvis du allerede er registrert, logg inn',
                style: TextStyle(fontSize: 18),
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Vennligst skriv inn Brukernavn'),
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Vennligst skriv inn Passord'),
              ),
              FlatButton(
                child: Text(
                  'Bekreft',
                ),
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                      ctx, MaterialPageRoute(builder: (ctx) => MyApp()));
                },
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
