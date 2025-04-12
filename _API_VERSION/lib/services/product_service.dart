import 'dart:convert';

import 'package:ichwan_shoe_market/constant.dart';
import 'package:ichwan_shoe_market/error.dart';
import 'package:http/http.dart' as http;
import 'package:ichwan_shoe_market/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductServices {
  Future<Map<String, dynamic>?> getProducts(
    String? category, {
    bool isNew = false,
    bool isPopular = false,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await http.get(
          Uri.parse(
              '$baseUrl/products?isPopular=$isPopular&isNew=$isNew&category=$category'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });

      final body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> dataList = body["data"];
        final products = List<ProductModel>.from(
          dataList.map((x) => ProductModel.fromJson(x)),
        );

        return {
          'status': true,
          'message': body['message'],
          'products': products
        };
      } else {
        return {'status': false, 'message': body['message']};
      }
    } catch (e) {
      return handleError(e);
    }
  }

  Future<Map<String, dynamic>?> getDetailProduct(int? productId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await http
          .get(Uri.parse('$baseUrl/products/${productId}'), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });

      final body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return {
          'status': true,
          'message': body['message'],
          'product': ProductModel.fromJson(body['data'])
        };
      } else {
        return {'status': false, 'message': body['message']};
      }
    } catch (e) {
      return handleError(e);
    }
  }

  Future<Map<String, dynamic>?> getSimilarProduct(
    String? category,
    int? productId,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await http.get(
          Uri.parse(
              '$baseUrl/products/similar?category=$category&productId=$productId'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });

      final body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> dataList = body["data"];
        final products = List<ProductModel>.from(
          dataList.map((x) => ProductModel.fromJson(x)),
        );

        return {
          'status': true,
          'message': body['message'],
          'products': products
        };
      } else {
        return {'status': false, 'message': body['message']};
      }
    } catch (e) {
      return handleError(e);
    }
  }

  Future<Map<String, dynamic>?> handleFavorite(int productId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await http.post(Uri.parse('$baseUrl/favorites'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode({'product_id': productId}));

      final body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return {'status': true, 'message': body['message']};
      } else {
        return {'status': false, 'message': body['message']};
      }
    } catch (e) {
      return handleError(e);
    }
  }
}
