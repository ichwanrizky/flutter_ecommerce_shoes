import 'dart:convert';

import 'package:ichwan_shoe_market/constant.dart';
import 'package:ichwan_shoe_market/error.dart';
import 'package:http/http.dart' as http;
import 'package:ichwan_shoe_market/models/product_model.dart';

class ProductServices {
  Future<Map<String, dynamic>?> getProducts(
    String? category, {
    bool isNew = false,
    bool isPopular = false,
  }) async {
    try {
      final response = await http.get(
          Uri.parse(
              '$baseUrl/products?isPopular=$isPopular&isNew=$isNew&category=$category'),
          headers: {
            'Content-Type': 'application/json',
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

  Future<Map<String, dynamic>?> getSimilarProduct(
    String? category,
    int? productId,
  ) async {
    try {
      final response = await http.get(
          Uri.parse(
              '$baseUrl/products/similar?category=$category&productId=$productId'),
          headers: {
            'Content-Type': 'application/json',
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
}
