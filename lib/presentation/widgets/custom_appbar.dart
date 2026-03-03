import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:idea/routing/app_routes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onRegisterTap;
  final VoidCallback? onSignUpTap;
  final String? logoAssetPath;
  final double height;

  const CustomAppBar({
    super.key,
    this.onRegisterTap,
    this.onSignUpTap,
    this.logoAssetPath,
    this.height = kToolbarHeight + 10,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 2,
      shadowColor: Colors.black12,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Row(
          children: [
            // Logo
            logoAssetPath != null
                ? Image.asset(logoAssetPath!, height: 38, fit: BoxFit.contain)
                : const _PlaceholderLogo(),

            // Spacer pushes buttons to the right
            const Spacer(),

            // Register Button (outlined)
            _OutlinedNavButton(label: 'Register', onTap: onRegisterTap),

            const SizedBox(width: 10),

            // Sign Up Button (filled)
            _FilledNavButton(label: 'Sign In', onTap: onSignUpTap),
          ],
        ),
      ),
    );
  }
}

// Placeholder logo — replace with Image.asset when you have a real logo
class _PlaceholderLogo extends StatelessWidget {
  const _PlaceholderLogo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: const Color(0xFF6C63FF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.bolt_rounded, color: Colors.white, size: 22),
        ),
        const SizedBox(width: 8),
        const Text(
          'MyApp',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1A2E),
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}

class _OutlinedNavButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  const _OutlinedNavButton({required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){
        context.push(AppRoutes.registerRoute);
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF6C63FF),
        side: const BorderSide(color: Color(0xFF6C63FF), width: 1.5),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      child: Text(label, style: TextStyle(color: Colors.white),),
    );
  }
}

class _FilledNavButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  const _FilledNavButton({required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
     onPressed: onTap ?? () {
      
     },
      style: ElevatedButton.styleFrom(
       backgroundColor: Colors.green[800], // 👈 makes it permanently green
    foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      child: Text(label),
    );
  }
}