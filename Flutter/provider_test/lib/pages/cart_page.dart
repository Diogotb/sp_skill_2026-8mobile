import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/providers/cart_provider.dart';

import '../consts.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(), body: _buildUI());
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text("Cart"),
      actions: [Consumer<CartProvider>(builder: (_, provider, _) {
        return IconButton(onPressed: () => provider.removeAll(), icon: Icon(Icons.delete_forever));
      })],
    );
  }

  Widget _buildUI() {
    return Consumer<CartProvider>(
      builder: (context, provider, _) {
        return Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.80,
              child: ListView.builder(
                itemCount: provider.cart.length,
                itemBuilder: (context, index) {
                  final Product product = provider.cart[index];
                  return ListTile(
                    onLongPress: () {
                      provider.remove(product);
                    },
                    title: Text(product.name),
                  );
                },
              ),
            ),
            Text("Cart Total: \$${provider.getCartTotal()}"),
          ],
        );
      },
    );
  }
}
