import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubit/auth_cubit.dart';

class TextFieldAuth extends StatelessWidget {
  const TextFieldAuth({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String label;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    final color = Theme.of(context).colorScheme;

    return TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          label: Text(label),
          labelStyle: GoogleFonts.plusJakartaSans(),
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: authCubit.obsecurePassword,
                  icon: !authCubit.getIsObsecure
                      ? Icon(CupertinoIcons.eye_fill, color: color.primary)
                      : Icon(CupertinoIcons.eye_slash_fill,
                          color: color.primary),
                )
              : null,
        ),
        obscureText: isPassword ? !authCubit.isObsecure : false,
        validator: authCubit.validate);
  }
}
