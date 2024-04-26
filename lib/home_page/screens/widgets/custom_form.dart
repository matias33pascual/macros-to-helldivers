import 'package:flutter/material.dart';
import 'package:macro_sync_client/home_page/providers/exports_providers.dart';
import 'package:macro_sync_client/shared/exports_shared.dart';
import 'package:provider/provider.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKeyIp = GlobalKey<FormState>();
    final formKeyPort = GlobalKey<FormState>();

    final HomeProvider provider = Provider.of<HomeProvider>(context);

    return Column(
      children: [
        CustomInputField(
          hintText: "DIRECCION IP",
          formKey: formKeyIp,
          onChangedHandle: (String value) =>
              provider.setIPAddress(value, context),
        ),
        const SizedBox(height: 10),
        CustomInputField(
          hintText: "PUERTO",
          textInputType: TextInputType.number,
          formKey: formKeyPort,
          onChangedHandle: (String value) => provider.setPort(value, context),
        ),
      ],
    );
  }
}
