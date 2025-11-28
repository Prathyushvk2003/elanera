import 'package:elanera/screens/plistscreen/model/product_model.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Prod extends StatefulWidget {

  final ProductModel productList;

  const Prod({super.key, required this.productList});

  @override
  State<Prod> createState() => _ProdState();
}

class _ProdState extends State<Prod> {
  String selectedSize = 'M';

  List<String> sizes = ['S', 'M', 'L', 'XL', '2XL'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Product Image and Top Buttons
            Stack(
              children: [
                Image.network(widget.productList.image,
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.shopping_bag_outlined),
                      onPressed: () {
                        // Go to cart
                      },
                    ),
                  ),
                ),
              ],
            ),

            // Details Section
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: ListView(
                  children: [
                     Text(
                      widget.productList.title,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Text(
                          widget.productList.category,
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$${widget.productList.price}',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Image thumbnails (placeholders)
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.network(
                            widget.productList.image, // Use different thumbnails
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Size Selector
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Size", style: TextStyle(fontWeight: FontWeight.bold)),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Size Guide"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: sizes.map((size) {
                        return ChoiceChip(
                          label: Text(size),
                          selected: selectedSize == size,
                          onSelected: (selected) {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          selectedColor: Colors.deepPurple,
                          backgroundColor: Colors.grey[200],
                          labelStyle: TextStyle(
                            color: selectedSize == size ? Colors.white : Colors.black,
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 20),

                    // Description
                    const Text("Description", style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                     Text(
                      widget.productList.description,
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Read More.."),
                    ),

                   
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xFF9C60FF),
        child: SafeArea(
          child: TextButton(
            onPressed: () {
              // Add to cart logic
            },
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Add to Cart",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
