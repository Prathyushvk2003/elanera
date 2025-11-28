import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:elanera/screens/loginscreen/model/user_model.dart';
import 'package:elanera/screens/plistscreen/model/product_model.dart';

class ApiService {
  static const String _baseUrl = 'https://fakestoreapi.com';

  /// Login using username and password
  static Future<UserModel?> login(String username, String password) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/users'));

      if (response.statusCode == 200) {
        List jsonData = json.decode(response.body);
        List<UserModel> users =
        jsonData.map((json) => UserModel.fromJson(json)).toList();

        return users.firstWhere(
              (user) =>
          user.username == username && user.password == password,
          orElse: () => throw Exception('Invalid credentials'),
        );
      } else {
        throw Exception('Failed to fetch users');
      }
    } catch (e) {
      print("Login Error: $e");
      return null;
    }
  }

  /// Signup using UserModel (fixed version)
  static Future<bool> createUser(UserModel user) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/users'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(user.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Signup Success: ${response.body}");
        return true;
      } else {
        print("Signup Failed: ${response.statusCode} - ${response.body}");
        return false;
      }
    } catch (e) {
      print("Signup Error: $e");
      return false;
    }
  }

  // /// Signup API call with UUID-based ID (not in use)
  // static Future<bool> signUp(UserModel user) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse('$_baseUrl/users'),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode(user.toJson()),
  //     );
  //
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       print("Signup successful: ${response.body}");
  //       return true;
  //     } else {
  //       print("Signup failed: ${response.body}");
  //       return false;
  //     }
  //   } catch (e) {
  //     print("Signup Error: $e");
  //     return false;
  //   }
  // }

  /// Fetch all products
  static Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  /// Fetch a single product
  static Future<ProductModel?> fetchProduct() async {
    final response = await http.get(Uri.parse("$_baseUrl/products/1"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return ProductModel.fromJson(data);
    } else {
      return null;
    }
  }
}
