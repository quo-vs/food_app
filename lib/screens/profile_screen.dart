import 'package:flutter/material.dart';
import 'package:fooderlich/components/circle_image.dart';
import 'package:fooderlich/models/models.dart';
import 'package:fooderlich/models/profile_manager.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  const ProfileScreen({ 
    Key? key, 
    required this.user 
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            // close
          },
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16,),
            _buildProfile(),
            Expanded(child: _buildMenu(),),
          ],
        ),
      ),
    );
  }

  Widget _buildMenu() {
    return ListView(
      children: [
        _buildDarkModeRow(),
        ListTile(
          title: const Text('View site'),
          onTap: () {
             // open webview
          },
        ),
        ListTile(
          title: const Text('Log out'),
          onTap: () {
             // log out
          },
        ),
      ],
    );
  }

  Widget _buildDarkModeRow() {
    return Padding(padding: 
    const EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Dark Mode'),
        Switch(value: widget.user.darkMode, 
        onChanged: (value) {
          Provider.of<ProfileManager>(context, listen: false).darkMode = value;
        })
      ],
    ),);
  }

  Widget _buildProfile() {
    return Column(
      children: [
        CircleImage(
          imageProvider: AssetImage(widget.user.profileImageUrl),
          imageRadius: 60,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(widget.user.firstName, style: const TextStyle(fontSize: 21),),
        Text(widget.user.role),
        Text('${widget.user.points} points',
        style: const TextStyle(fontSize: 30, color: Colors.green),)
      ],
    );
  }
}