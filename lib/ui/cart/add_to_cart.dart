import 'package:flutter/material.dart';
import 'package:noteapp/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class AddToCart extends StatefulWidget {
  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    final dataCart = Provider.of<CartProvider>(context, listen: false);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back,
            ),
            onTap: () => Navigator.of(context).pop(),
          ),
          // automaticallyImplyLeading: false,
          title: Text(
            'Cart',
            style: TextStyle(fontSize: 16.0),
          ),
          bottom: PreferredSize(
            child: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.white.withOpacity(0.3),
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  child: Text('Add Cart'),
                ),
                Tab(
                  child: Text('Investment'),
                ),
                Tab(
                  child: Text('Your Earning'),
                ),
                Tab(
                  child: Text('Current Balance'),
                ),
              ],
            ),
            preferredSize: Size.fromHeight(30.0),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () {
                print("DELETE ALL");
                dataCart.clearCart();
              },
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Consumer<CartProvider>(builder: (context, cartNotif, _) {
              if (cartNotif.total == 0) {
                return Container(
                  child: Center(
                    child: Text(
                      "Data Kosong",
                    ),
                  ),
                );
              } else {
                return Container(
                  child: Center(
                    child: Text(
                      "Data Ada",
                    ),
                  ),
                );
              }
            }),
            Container(
              child: Center(
                child: Text('Tab Investment'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Tab Your Earning'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Tab Current Balance'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
