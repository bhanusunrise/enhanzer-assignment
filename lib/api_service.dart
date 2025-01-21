import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'db_helper.dart';
import 'user.dart';
import 'permission.dart';
import 'location.dart';

class ApiService {
  Future<void> invokeApi(String email, String password) async {
    final url = Uri.parse('https://api.ezuite.com/api/External_Api/Mobile_Api/Invoke');

    final body = {
      "API_Body": [
        {"Unique_Id": "", "Pw": password}
      ],
      "Api_Action": "GetUserData",
      "Company_Code": email
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['Status_Code'] == 200) {
          final userData = data['Response_Body'][0];

          // Create User object
          final user = User(
            user_display_name: userData['User_Display_Name'],
            user_email: userData['Email'],
            user_company_code: userData['Company_Code'],
            user_employee_code: userData['User_Employee_Code'],
          );

          // Insert user into the database
          final db = DatabaseHelper.instance;
          final userId = await db.insertUser(user);

          // Insert permissions
          for (var permissionData in userData['User_Permissions']) {
            final permission = Permission(
              permission_name: permissionData['Permisson_Name'],
              permission_status: permissionData['Permission_Status'],
              user_id: userId,
            );
            await db.insertPermission(permission);
          }

          // Insert locations
          for (var locationData in userData['User_Locations']) {
            final location = Location(
              location_code: locationData['Location_Code'],
              user_id: userId,
            );
            await db.insertLocation(location);
          }

          if (kDebugMode) {
            print('Data inserted successfully');
          }
        } else {
          if (kDebugMode) {
            print('API Error: ${data['Message']}');
          }
        }
      } else {
        if (kDebugMode) {
          print('Failed with status code: ${response.statusCode}');
          print('Response body: ${response.body}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }
}
