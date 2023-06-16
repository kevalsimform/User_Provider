import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:user_provider/utils/provider/user_provider.dart';
import 'package:user_provider/validators/app_validators.dart';
import 'package:user_provider/value/app_globals/app_strings.dart';

import '../model/user_model.dart';

class UserInfoScreen extends StatefulWidget {
  final User? user;

  const UserInfoScreen({super.key, this.user});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  late TextEditingController nameController;
  late TextEditingController mobileController;
  late TextEditingController emailController;
  late TextEditingController addressController;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.user?.name);
    mobileController = TextEditingController(text: widget.user?.mobile);
    emailController = TextEditingController(text: widget.user?.email);
    addressController = TextEditingController(text: widget.user?.address);
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.detailsTitles(widget.user)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  validator: AppValidators.nameValidator,
                  decoration: InputDecoration(hintText: AppStrings.nameHintText),
                ),
                TextFormField(
                  controller: emailController,
                  validator: AppValidators.emailValidator,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: AppStrings.emailHintText),
                ),
                TextFormField(
                  controller: mobileController,
                  validator: AppValidators.mobileNumValidator,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(hintText: AppStrings.mobileHintText),
                ),
                TextFormField(
                  controller: addressController,
                  validator: AppValidators.addressValidator,
                  decoration: InputDecoration(hintText: AppStrings.addressHintText),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    User user = User(
                      name: nameController.text.trim(),
                      email: emailController.text.trim(),
                      address: addressController.text.trim(),
                      mobile: mobileController.text.trim(),
                    );

                    if (widget.user != null) {
                      List<User> users = context.read<UserProvider>().users;
                      AppValidators.validateEditUser(formKey, context, users.indexOf(widget.user!), user);
                    } else {
                      AppValidators.validateAddUser(formKey, context, user);
                    }
                  },
                  child: Text(
                    AppStrings.submitButtonTitle(widget.user),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
