import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter UI Task',
      theme: ThemeData(useMaterial3: false, primarySwatch: Colors.blue),
      home: const UserEntryScreen(),
    );
  }
}

class UserEntryScreen extends StatefulWidget {
  const UserEntryScreen({super.key});

  @override
  State<UserEntryScreen> createState() => _UserEntryScreenState();
}

class _UserEntryScreenState extends State<UserEntryScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 30.0,
            bottom: 30.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAvatar(),
              const SizedBox(height: 20),
              _buildWelcomeText(),
              const SizedBox(height: 10),
              _buildRatingIcon(),
              const SizedBox(height: 30),
              _buildFormCard(Colors.blue),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: const Text(
        'Flutter UI Task',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      elevation: 4.0,
    );
  }

  Widget _buildAvatar() {
    return const CircleAvatar(
      radius: 60,
      backgroundColor: Colors.blue,
      backgroundImage: NetworkImage(
        'https://img.freepik.com/free-photo/handsome-smiling-man-looking-with-satisfied-expression_176420-19156.jpg',
      ),
    );
  }

  Widget _buildWelcomeText() {
    return const Text(
      'Welcome to Flutter',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildRatingIcon() {
    return const Icon(Icons.star, color: Colors.amber, size: 50);
  }

  Widget _buildFormCard(Color actionColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000), // Equivalent to black.withOpacity(0.1)
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 15),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 25),
          _buildSubmitButton(actionColor),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(Color color) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Submit',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
