import 'package:flutter/material.dart';

class AddNewCardPage extends StatefulWidget {
  const AddNewCardPage({super.key});

  @override
  State<AddNewCardPage> createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
  String selectedMethod = "mastercard";

  final TextEditingController _cardOwnerController =
  TextEditingController(text: "Mrh Raju");
  final TextEditingController _cardNumberController =
  TextEditingController(text: "5254 7634 8734 7690");
  final TextEditingController _expController =
  TextEditingController(text: "24/24");
  final TextEditingController _cvvController =
  TextEditingController(text: "7763");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back + Title
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(width: 100),
                  const Text(
                    "Add New Card",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),

              const SizedBox(height: 30),

              // Payment Options
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  paymentOption("assets/mastercard.png", "mastercard"),
                  paymentOption("assets/paypal.png", "paypal"),
                  paymentOption("assets/bank.png", "bank"),
                ],
              ),

              const SizedBox(height: 30),

              const Text("Card Owner", style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              inputField(_cardOwnerController, "Enter card holder name"),

              const SizedBox(height: 20),

              const Text("Card Number", style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              inputField(_cardNumberController, "Enter card number"),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("EXP", style: TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 8),
                        inputField(_expController, "MM/YY"),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("CVV", style: TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 8),
                        inputField(_cvvController, "CVV"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // Bottom Button
      bottomNavigationBar: Container(
        width: double.infinity,
        color: const Color.fromARGB(255, 248, 243, 237),
        child: TextButton(
          onPressed: () {
            print("Selected: $selectedMethod");
            print("Owner: ${_cardOwnerController.text}");
            print("Number: ${_cardNumberController.text}");
            print("EXP: ${_expController.text}");
            print("CVV: ${_cvvController.text}");
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "Add Card",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  Widget inputField(TextEditingController controller, String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6FA),
        borderRadius: BorderRadius.circular(12),
      ),
      height: 55,
      alignment: Alignment.centerLeft,
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget paymentOption(String imagePath, String methodKey) {
    bool isSelected = selectedMethod == methodKey;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMethod = methodKey;
        });
      },
      child: Container(
        height: 50,
        width: 70,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F6FA),
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(color: const Color(0xFF9B5DE5), width: 2)
              : null,
        ),
        child: Center(
          child: Image.asset(imagePath, height: 24),
        ),
      ),
    );
  }
}
