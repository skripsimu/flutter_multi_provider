import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart.dart';
import 'money.dart';

void main() => runApp(MultipleProvider());

class MultipleProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Money>(
            builder: (context) => Money(),
          ),
          ChangeNotifierProvider<Cart>(
            builder: (context) => Cart(),
          ),
        ],
        child: Scaffold(
          floatingActionButton: Consumer<Money>(
            builder: (context, money, _) => Consumer<Cart>(
                builder: (context, cart, _) => Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FloatingActionButton(
                          onPressed: () {
                            if (money.balance >= 0 && cart.quantity >= 1) {
                              cart.quantity -= 1;
                              money.balance += 500;
                            }
                          },
                          child: Icon(
                            Icons.remove,
                            color: Colors.black,
                          ),
                          backgroundColor: Colors.amber,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            if (money.balance >= 500) {
                              cart.quantity += 1;
                              money.balance -= 500;
                            }
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                          backgroundColor: Colors.amber,
                        )
                      ],
                    )),
          ),
          appBar: AppBar(
            title: Text(
              "Multi Provider",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.amber,
          ),
          body: Column(
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(5),
                height: 200,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 30,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Apple",
                              style: TextStyle(
                                fontSize: 28,
                              ),
                            ),
                            Text(
                              "Rp. 500",
                              style: TextStyle(
                                fontSize: 28,
                              ),
                            ),
                          ],
                        )),
                    Container(
                      width: double.infinity,
                      height: 140,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.monetization_on,
                        size: 150,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                    Consumer<Cart>(
                      builder: (context, cart, _) => Text(
                        cart.quantity.toString(),
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Total Payment",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                    Consumer<Cart>(
                      builder: (context, cart, _) => Text(
                        "Rp. " + (500 * cart.quantity).toString(),
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Balance",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                    Consumer<Money>(
                      builder: (context, money, _) => Text(
                        "Rp. " + money.balance.toString(),
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
