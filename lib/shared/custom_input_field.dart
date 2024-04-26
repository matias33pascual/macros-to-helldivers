import 'package:flutter/material.dart';
import 'package:macro_sync_client/theme/app_theme.dart';

class CustomInputField extends StatefulWidget {
  final String hintText;
  final TextInputType textInputType;
  final GlobalKey formKey;
  final Function(String)? onChangedHandle;

  const CustomInputField({
    Key? key,
    required this.hintText,
    required this.formKey,
    this.textInputType = TextInputType.text,
    this.onChangedHandle,
  }) : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late FocusNode _focusNode;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  _handleFocusChange() {
    setState(() {
      _hasFocus = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appColors = AppTheme.colors;
    final textStyles = AppTheme.textStyles;

    return Container(
      decoration: BoxDecoration(
        border: _hasFocus
            ? Border(
                left: BorderSide(
                width: 3,
                color: appColors.leftBorderMenuItemSelected,
              ))
            : null,
      ),
      child: TextField(
        key: widget.formKey,
        focusNode: _focusNode,
        onChanged: widget.onChangedHandle,
        cursorColor: appColors.cursor,
        cursorWidth: 3,
        style: textStyles.menu,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: textStyles.hintText,
          filled: true,
          fillColor: _hasFocus
              ? appColors.menuItemSelected
              : appColors.menuItemBackground,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
