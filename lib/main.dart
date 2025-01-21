import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
                height: 200.0,
                width: 200.0,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Email : ",
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
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
                    onPressed: () {},
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
                    onPressed: () {},
                    child: const Text('Reset'),
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
