import 'package:flutter/material.dart';
import 'package:pasindu_bhanuka/db_helper.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'api_service.dart';

void main() async {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enhanzer Assignment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Enhanzer Assignment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: Image(
                image: AssetImage('assets/login/login.png'),
                height: 150.0,
                width: 150.0,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Email : ",
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'someone@example.com',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Password : ",
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 8.0),
            PasswordField(
              controller: _passwordController,
              color: Colors.blue,
              passwordConstraint: r'.*[@$#.*].*',
              hintText: '********',
              border: PasswordBorder(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue.shade100,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue.shade100,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.red.shade200,
                  ),
                ),
              ),
              errorMessage: 'must contain special character either . * @ # \$',
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                SizedBox(
                  width: 100.0,
                  height: 50.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () async {
                      final email = _emailController.text;
                      final password = _passwordController.text;

                      // Call the API service
                      await ApiService().invokeApi(email, password);

                      // Fetch data from the database
                      final List<Map<String, dynamic>> data = await DatabaseHelper.instance.fetchData();

                      // Print or use the fetched data as needed
                      print('Fetched Data: $data');
                    },
                    child: const Text('Login'),
                  ),
                ),
                const SizedBox(width: 8.0),
                SizedBox(
                  width: 100.0,
                  height: 50.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                    ),
                    onPressed: () {
                      _emailController.clear();
                      _passwordController.clear();
                    },
                    child: const Text('Reset'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
