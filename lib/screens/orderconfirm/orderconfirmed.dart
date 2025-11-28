import 'package:flutter/material.dart';

class OrderConfirmed extends StatelessWidget {
  const OrderConfirmed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Background from your image
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Back Button
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Order Image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                'assets/orderconfirmed.jpg', // replace with your image path
                height: 350,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 30),

            // Order Confirmed Text
            const Text(
              "Order Confirmed!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Text(
                "Your order has been confirmed, we will send you confirmation email shortly.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),

            const SizedBox(height: 20),

            // Go to Orders Button
            ElevatedButton(
              onPressed: () {
                // Go to Orders functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text("Go to Orders"),
            ),
          ],
        ),
      ),

      // Bottom Button + Navigation
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 248, 243, 237),
            child: TextButton(
              onPressed: () {
                // Continue shopping
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "Continue Shopping",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
