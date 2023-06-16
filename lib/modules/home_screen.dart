import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_provider/value/app_globals/app_strings.dart';

import '../model/user_model.dart';
import '../utils/provider/user_provider.dart';
import 'user_info_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider? userProvider = context.read<UserProvider?>();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.users),
      ),
      body: userProvider != null
          ? Selector<UserProvider, int>(
              selector: (context, userProvider) => userProvider.users.length,
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value,
                  itemBuilder: (context, index) {
                    User user = userProvider.users[index];
                    return Selector<UserProvider, User>(
                      selector: (_, userProvider) => userProvider.users[index],
                      builder: (context, value, child) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Center(
                              child: Text(userProvider.users[index].name),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => UserInfoScreen(user: user),
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete_forever),
                                  onPressed: () {
                                    context.read<UserProvider>().deleteUserAt(user);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(AppStrings.userDeletedSuccessfully),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                children: [
                                  Text(user.mobile),
                                  Text(user.email),
                                  Text(user.address),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            )
          : Center(
              child: Text(AppStrings.somethingWentWrong),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const UserInfoScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
