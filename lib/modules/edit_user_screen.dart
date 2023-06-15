import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_provider/utils/provider/user_provider.dart';

import '../model/user_model.dart';

class EditUserScreen extends StatefulWidget {
  final User user;

  const EditUserScreen({super.key, required this.user});

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  late int userIndex;
  late TextEditingController nameController;
  late TextEditingController mobileController;
  late TextEditingController emailController;
  late TextEditingController addressController;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.user.name);
    mobileController = TextEditingController(text: widget.user.mobile);
    emailController = TextEditingController(text: widget.user.email);
    addressController = TextEditingController(text: widget.user.email);
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    List<User> users = context.watch<UserProvider>().users;
    userIndex = users.indexOf(widget.user);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              TextField(
                controller: nameController,
              ),
              TextField(controller: emailController),
              TextField(controller: mobileController),
              TextField(controller: addressController),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (nameController.text.trim() != '' &&
                        emailController.text.trim() != '' &&
                        addressController.text.trim() != '' &&
                        mobileController.text.trim() != '') {
                      context.read<UserProvider>().editUserAt(
                            userIndex,
                            User(
                              name: nameController.text,
                              email: emailController.text,
                              address: addressController.text,
                              mobile: mobileController.text,
                            ),
                          );
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Update'))
            ],
          ),
        ),
      ),
    );
  }
}
