import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/config.dart';
import '../../controller/register_controller.dart';

class RegisterField extends StatefulWidget {
  RegisterField(
      {Key? key,
      required this.controller,
      required this.type,
      required this.hintText,
      required this.formType,
      this.suf,
      this.observer,
      this.validation})
      : super(key: key);

  final TextEditingController controller;
  final TextInputType type;
  final String hintText;
  final IconData? suf;
  final String Function(dynamic value)? validation;
  final String formType;
  bool? observer;

  @override
  State<RegisterField> createState() => _RegisterFieldState();
}

class _RegisterFieldState extends State<RegisterField> {
  final FocusNode _focusNode = FocusNode();
  final controller = Get.put(RegisterController());
  bool isEmail = false;
  bool isPassword = false;
  bool isPasswordConfirm = false;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      keyboardType: widget.type,
      obscureText: widget.observer ?? false,
      onChanged: (value) {
        Get.find<RegisterController>().onChangeFiled(
          controller: widget.controller,
          text: value,
        );
        // controller.test(value);
      },
      validator: (value) {
        print(widget.formType);
        if (widget.formType == 'email') {
          isEmail = controller.onEmailValidate(text: value!);
          return isEmail ? null : "올바른 이메일 형식 입력해주세요";
        } else if (widget.formType == 'password') {
          isPassword = controller.onPasswordValidate(text: value!);
          return isPassword ? null : "숫자, 문자, 특수문자 포함 8자 이상";
        } else if (widget.formType == 'passwordConfirm') {
          isPasswordConfirm =
              controller.passwordController.text == widget.controller.text
                  ? true
                  : false;
          return isPasswordConfirm ? null : "비밀번호가 일치하지 않습니다.";
        }
        return null;
      },
      focusNode: _focusNode,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          color: Config.hintTextColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: widget.observer != null
            ? GestureDetector(
                onTap: () {
                  widget.observer = !widget.observer!;
                  setState(
                    () {},
                  );
                },
                child: Icon(
                  widget.observer! ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
      ),
    );
  }
}
