import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pagination/pages/user_detail/user_detail_screen_vm.dart';
import 'package:provider/provider.dart';

import '../home_page/user_list_model.dart';

class UserDetailScreen extends StatelessWidget {
  static const routeName = 'helpers_landing';

  static const paramUserModel = 'user_model';

  final Function? reloadData;
  final Person person;

  const UserDetailScreen({Key? key, this.reloadData,required this.person,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return UserDetailScreenVM(person);
      },
      child: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Consumer<UserDetailScreenVM>(builder: (_, vm, __) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Person Details'),
        ),
        body:_helpersBody(vm, context),
      );
    });
  }

  Widget _helpersBody(UserDetailScreenVM vm, BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('ID'),
            subtitle: Text(person.id.toString()),
          ),
          ListTile(
            title: Text('First Name'),
            subtitle: Text(person.firstName),
          ),
          ListTile(
            title: Text('Last Name'),
            subtitle: Text(person.lastName),
          ),
          ListTile(
            title: Text('Maiden Name'),
            subtitle: Text(person.maidenName),
          ),
          ListTile(
            title: Text('Age'),
            subtitle: Text(person.age.toString()),
          ),
          ListTile(
            title: Text('Gender'),
            subtitle: Text(person.gender),
          ),
          ListTile(
            title: Text('Email'),
            subtitle: Text(person.email),
          ),
          ListTile(
            title: Text('Phone'),
            subtitle: Text(person.phone),
          ),
          ListTile(
            title: Text('Username'),
            subtitle: Text(person.username),
          ),
          ListTile(
            title: Text('Password'),
            subtitle: Text(person.password),
          ),
          ListTile(
            title: Text('Birth Date'),
            subtitle: Text(person.birthDate),
          ),
          ListTile(
            title: Text('Blood Group'),
            subtitle: Text(person.bloodGroup),
          ),
          ListTile(
            title: Text('Height'),
            subtitle: Text(person.height.toString()),
          ),
          ListTile(
            title: Text('Weight'),
            subtitle: Text(person.weight.toString()),
          ),
          ListTile(
            title: Text('Eye Color'),
            subtitle: Text(person.eyeColor),
          ),
          ListTile(
            title: Text('Hair Color'),
            subtitle: Text(person.hair.color),
          ),
          ListTile(
            title: Text('Hair Type'),
            subtitle: Text(person.hair.type),
          ),
          ListTile(
            title: Text('Domain'),
            subtitle: Text(person.domain),
          ),
          ListTile(
            title: Text('IP Address'),
            subtitle: Text(person.ip),
          ),
          ListTile(
            title: Text('Address'),
            subtitle: Text(person.address.address),
          ),
          ListTile(
            title: Text('City'),
            subtitle: Text(person.address.city),
          ),
          ListTile(
            title: Text('Postal Code'),
            subtitle: Text(person.address.postalCode),
          ),
          ListTile(
            title: Text('State'),
            subtitle: Text(person.address.state),
          ),
          ListTile(
            title: Text('Latitude'),
            subtitle: Text(person.address.coordinates.lat.toString()),
          ),
          ListTile(
            title: Text('Longitude'),
            subtitle: Text(person.address.coordinates.lng.toString()),
          ),
          ListTile(
            title: Text('MAC Address'),
            subtitle: Text(person.macAddress),
          ),
          ListTile(
            title: Text('University'),
            subtitle: Text(person.university),
          ),
          ListTile(
            title: Text('Card Expire'),
            subtitle: Text(person.bank.cardExpire),
          ),
          ListTile(
            title: Text('Card Number'),
            subtitle: Text(person.bank.cardNumber),
          ),
          ListTile(
            title: Text('Card Type'),
            subtitle: Text(person.bank.cardType),
          ),
          ListTile(
            title: Text('Currency'),
            subtitle: Text(person.bank.currency),
          ),
          ListTile(
            title: Text('IBAN'),
            subtitle: Text(person.bank.iban),
          ),
          ListTile(
            title: Text('Company Name'),
            subtitle: Text(person.company.name),
          ),
          ListTile(
            title: Text('Company Department'),
            subtitle: Text(person.company.department),
          ),
          ListTile(
            title: Text('Company Title'),
            subtitle: Text(person.company.title),
          ),
          ListTile(
            title: Text('Company Address'),
            subtitle: Text(person.company.address.address),
          ),
          ListTile(
            title: Text('Company City'),
            subtitle: Text(person.company.address.city),
          ),
          ListTile(
            title: Text('Company Postal Code'),
            subtitle: Text(person.company.address.postalCode),
          ),
          ListTile(
            title: Text('Company State'),
            subtitle: Text(person.company.address.state),
          ),
          ListTile(
            title: Text('Company Latitude'),
            subtitle: Text(person.company.address.coordinates.lat.toString()),
          ),
          ListTile(
            title: Text('Company Longitude'),
            subtitle: Text(person.company.address.coordinates.lng.toString()),
          ),
          ListTile(
            title: Text('EIN'),
            subtitle: Text(person.ein),
          ),
          ListTile(
            title: Text('SSN'),
            subtitle: Text(person.ssn),
          ),
          ListTile(
            title: Text('User Agent'),
            subtitle: Text(person.userAgent),
          ),
        ],
      ),
    );
  }
}
