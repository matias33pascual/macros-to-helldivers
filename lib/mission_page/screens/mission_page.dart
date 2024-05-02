import 'package:flutter/material.dart';
import 'package:macro_sync_client/mission_page/screens/widgets/mission_stratagems.dart';

class MissionPage extends StatelessWidget {
  const MissionPage({Key? key}) : super(key: key);

  static String routeName = "mission_page";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            _buildBackground(context),
            _buildPanel(context),
            const MissionStratagems(),
          ],
        ),
      ),
    );
  }

  Container _buildPanel(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black.withOpacity(0.4),
    );
  }

  Image _buildBackground(BuildContext context) {
    return Image.asset(
      "assets/images/mission_background.png",
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Colors.indigo[500],
      colorBlendMode: BlendMode.color,
    );
  }
}
