import '../user_detail/user_detail_screen.dart';
import 'user_list_screen_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) {
        return UserListWidgetVM(size);
      },
      child: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Consumer<UserListWidgetVM>(
      builder: (context, vm, __) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('User List with Pagination'),
          ),
          body: FutureBuilder(
            future: vm.loadUsers(pageOffset: vm.currentPage),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (vm.userList.isNotEmpty) {
                return ListView.separated(
                  controller: vm.controller,
                  itemCount: vm.userList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: InkWell(
                        child: Container(
                            //height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 3,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3)),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 10, 12, 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                                "Name - ${vm.getFirstName(index)} ${vm.getLastName(index)}")),
                                      ],
                                    ),
                                    Text("Gender - ${vm.getGender(index)}"),
                                    Text("Age - ${vm.getAge(index)}"),
                                    Text(
                                        "Phone Number - ${vm.getPhoneNumber(index)}"),
                                  ],
                                ),
                              ),
                            )),
                        onTap: () {
                          Navigator.pushNamed(
                              context, UserDetailScreen.routeName, arguments: {
                            UserDetailScreen.paramUserModel:
                                vm.getUserData(index)
                          });
                        },
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 16,
                    );
                  },
                );
              }

              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            },
          ),
        );
      },
    );
  }
}
