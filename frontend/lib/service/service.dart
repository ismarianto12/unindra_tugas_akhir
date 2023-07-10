import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:penitipan/env.dart';
import 'dart:convert';

class Service {
  static Future<List<dynamic>> getProfile(String token) async {
    final response =
        await http.post(Uri.parse(API_URL + "/user/profile?token=$token"));

    print(response.body);
    return json.decode(response.body);
  }

  static Future<List<dynamic>> apProve(String token) async {
    final response =
        await http.post(Uri.parse(API_URL + "/user/profile?token=$token"));

    print(response.body);
    return json.decode(response.body);
  }

  static Future<http.Response>? reject(String token) async {
    try {
      final response =
          await http.post(Uri.parse("$API_URL/profile?token$token"));
      if (response.statusCode == 200) {
        return response;
      } else {
        return http.Response('', 404);
      }
    } catch (e) {
      throw e;
    }
  }

  static Future<http.Response>? userList(String token) async {
    try {
      final response =
          await http.post(Uri.parse("$API_URL/userlist?token$token"));
      if (response.statusCode == 200) {
        return response;
      } else {
        return http.Response('', 404);
      }
    } catch (e) {
      throw e;
    }
  }
}
