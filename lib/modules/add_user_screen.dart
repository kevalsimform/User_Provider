import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_provider/utils/provider/user_provider.dart';

import '../model/user_model.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              TextField(controller: nameController, decoration: const InputDecoration(hintText: 'Name')),
              TextField(controller: emailController, decoration: const InputDecoration(hintText: 'Email')),
              TextField(controller: mobileController, decoration: const InputDecoration(hintText: 'Mobile Number')),
              TextField(controller: addressController, decoration: const InputDecoration(hintText: 'Address')),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (nameController.text.trim() != '' &&
                        emailController.text.trim() != '' &&
                        addressController.text.trim() != '' &&
                        mobileController.text.trim() != '') {
                      context.read<UserProvider>().addUser(
                            User(
                              name: nameController.text,
                              email: emailController.text,
                              address: addressController.text,
                              mobile: mobileController.text,
                            ),
                          );
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please Provide Valid Details...')));
                    }
                  },
                  child: const Text('Add User'))
            ],
          ),
        ),
      ),
    );
  }
}
