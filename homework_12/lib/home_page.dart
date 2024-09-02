import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  final _nameController = TextEditingController();
  final _photoUrlController = TextEditingController();

  User? _user;
  StreamSubscription<User?>? _userSubscription;

  @override
  void initState() {
    super.initState();

    _userSubscription = FirebaseAuth.instance.userChanges().listen((user) { 
      setState(() {
        _user = user;
      });
    });
    _user = _auth.currentUser;

    _nameController.text = _user?.displayName ?? '';
    _photoUrlController.text = _user?.photoURL ?? '';
  }

  @override
  void dispose() {
    _userSubscription?.cancel();
    _nameController.dispose();
    _photoUrlController.dispose();
    super.dispose();
  }

  Future<void> _saveProfileChanges() async {
    await _user?.updatePhotoURL(_photoUrlController.text);
    await _user?.updateDisplayName(_nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            }, 
            child: const Text('Sign Out'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24), 
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_user?.photoURL?.isNotEmpty == true) ...[
                Image.network(_user!.photoURL!, width: 300, height: 300),
                const SizedBox(height: 16),
              ],
              TextField(
                controller: _photoUrlController,
                decoration: const InputDecoration(labelText: 'Photo Url'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 16),
              Text('Email: ${_user?.email}'),
              const SizedBox(height: 32),
              TextButton(
                onPressed: _saveProfileChanges,
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
