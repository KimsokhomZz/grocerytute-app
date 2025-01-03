import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocerytute/components/grocery_item_tile.dart';
import 'package:grocerytute/model/cart_model.dart';
import 'package:grocerytute/screens/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CartPage();
            },
          ),
        ),
        shape: const CircleBorder(),
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
            //* good morning
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Good morning,',
              ),
            ),

            const SizedBox(height: 0.0),

            //* Let's order fresh items for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Let's order fresh items for you",
                style: GoogleFonts.notoSerif(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 24),

            //* divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),

            const SizedBox(height: 24),

            //* fresh items + grid
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Fresh items',
                style: TextStyle(fontSize: 16),
              ),
            ),

            Expanded(
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.2,
                    ),
                    itemCount: value.shopItems.length,
                    itemBuilder: (context, index) {
                      return GroceryItemTile(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        itemImage: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: () {
                          Provider.of<CartModel>(
                            context,
                            listen: false,
                          ).addItemToCart(index);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
