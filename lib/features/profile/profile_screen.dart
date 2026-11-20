import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowo/authentication/provider/auth_provider.dart';
import 'package:flowo/authentication/sigin_in_screen.dart';
import 'package:flowo/data/services/local_storage_service.dart';
import 'package:flowo/features/profile/widget/avatar_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  String _initials = 'JD';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final name = await LocalStorageService.getUsername() ?? '';
    if (mounted) {
      setState(() {
        _nameController.text = name;
        _updateInitials(name);
      });
    }
  }

  void _updateInitials(String name) {
    final trimmed = name.trim();
    if (trimmed.isEmpty) {
      _initials = 'JD';
    } else {
      final parts = trimmed.split(RegExp(r'\s+'));
      if (parts.length > 1) {
        _initials = '${parts[0][0]}${parts[1][0]}'.toUpperCase();
      } else {
        _initials = trimmed.length >= 2
            ? trimmed.substring(0, 2).toUpperCase()
            : trimmed[0].toUpperCase();
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userEmail =
        FirebaseAuth.instance.currentUser?.email ?? 'jordan@gmail.com';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor: Colors.transparent,
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              final nameToSave = _nameController.text.trim();
              if (nameToSave.isNotEmpty) {
                await LocalStorageService.saveUsername(nameToSave);
                await FirebaseAuth.instance.currentUser?.updateDisplayName(
                  nameToSave,
                );
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Display name saved!')),
                  );
                }
              }
            },
            child: Container(
              margin: const EdgeInsets.all(15),
              child: const Text(
                'Save',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 1),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              AvatarCard(initials: _initials),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('DISPLAY NAME'),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    height: 52,
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffE5E7EB)),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextField(
                      controller: _nameController,
                      onChanged: (val) {
                        setState(() {
                          _updateInitials(val);
                        });
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        hintText: 'Jordan Davis',
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                  const Text('ACCOUNT'),
                  Container(
                    height: 52,
                    width: 350,
                    margin: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xffE5E7EB)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Email', style: TextStyle(fontSize: 16)),
                          Text(
                            userEmail,
                            style: const TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 280),
                    height: 52,
                    width: 350,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        side: WidgetStatePropertyAll(
                          BorderSide(color: Color(0xffFCA5A5)),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          Color(0xffFFFFFF),
                        ),
                      ),
                      onPressed: () async {
                        AuthencticationProvider authstate =
                            AuthencticationProvider(context: context);
                        var auth = await authstate.signOut();

                        if (auth == true) {
                          await LocalStorageService.clear();
                          if (context.mounted) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (c) => SiginInScreen(),
                              ),
                            );
                          }
                        }
                      },
                      child: const Text(
                        'Sign Out',
                        style: TextStyle(
                          fontSize: 16.5,
                          color: Color(0xffEF4444),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
