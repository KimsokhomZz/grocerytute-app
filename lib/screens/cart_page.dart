import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocerytute/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "My Cart",
                  style: GoogleFonts.notoSerif(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              //* list of items in the cart
              Expanded(
                child: value.cartItems.isEmpty
                    ? Center(
                        child: Text(
                          'Card is empty...',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[400]),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: value.cartItems.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                leading: Image.asset(value.cartItems[index][2]),
                                title: Text(value.cartItems[index][0]),
                                subtitle:
                                    Text('\$ ${value.cartItems[index][1]}'),
                                trailing: IconButton(
                                  onPressed: () => Provider.of<CartModel>(
                                          context,
                                          listen: false)
                                      .removeItemFromCart(index),
                                  icon: const Icon(Icons.cancel),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),

              //* total + pay now
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //* total price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(color: Colors.green[100]),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$ ${value.totalPrice()}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      //* pay now button
                      GestureDetector(
                        onTap: () {
                          print('Pay Now');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green.shade100),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            children: [
                              Text(
                                'Pay Now',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 16,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
