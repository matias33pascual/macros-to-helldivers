// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:macro_sync_client/shared/custom_text.dart';
import 'package:macro_sync_client/shared/exports_shared.dart';
import 'package:macro_sync_client/shared/horizontal_bar.dart';
import 'package:macro_sync_client/stratagems_page/providers/stratagems_providers.dart';
import 'package:macro_sync_client/theme/app_theme.dart';
import 'package:provider/provider.dart';

class StratagemsPage extends StatelessWidget {
  const StratagemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StratagemsProvider provider =
        Provider.of<StratagemsProvider>(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar: CustomAppBar(
            title: "Estratagemas", color: Color(0xFF400015).withOpacity(0.3)),
        body: Stack(
          children: [
            Image.asset(
              "assets/images/stratagems_background.jpg",
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black.withOpacity(0.3),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: FutureBuilder(
                future: provider.loadStratagems(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.done:
                      return Column(
                        children: [
                          Flexible(
                            flex: 4,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) => Container(
                                height: 32,
                                margin: EdgeInsets.symmetric(vertical: 2),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(137, 81, 95, 122),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.2),
                                    width: 2,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SkullIcon(width: 32),
                                    Container(
                                      margin: EdgeInsets.only(left: 8),
                                      constraints:
                                          BoxConstraints(maxWidth: 300),
                                      child: CustomText(
                                        text: snapshot.data[index].name,
                                        size: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Colors.amber,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 16),
                            child: CustomText(
                              text: "SELECCIONADAS PARA MISION",
                              size: 16,
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 40,
                                        height: 40,
                                        color: Colors.amber),
                                    SizedBox(width: 16),
                                    Container(
                                        width: 40,
                                        height: 40,
                                        color: Colors.amber),
                                    SizedBox(width: 16),
                                    Container(
                                        width: 40,
                                        height: 40,
                                        color: Colors.amber),
                                  ],
                                ),
                                Expanded(child: Container()),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 50,
                                        height: 50,
                                        color: Colors.amber),
                                    SizedBox(width: 16),
                                    Container(
                                        width: 50,
                                        height: 50,
                                        color: Colors.amber),
                                    SizedBox(width: 16),
                                    Container(
                                        width: 50,
                                        height: 50,
                                        color: Colors.amber),
                                    SizedBox(width: 16),
                                    Container(
                                        width: 50,
                                        height: 50,
                                        color: Colors.amber),
                                  ],
                                ),
                                Expanded(child: Container()),
                                CustomButton(
                                  color: CustomButtonColors.yellow,
                                  text: "COMENZAR",
                                ),
                                Expanded(child: Container()),
                              ],
                            ),
                          )
                        ],
                      );
                    case ConnectionState.waiting:
                      return const CircularProgressIndicator();

                    default:
                      return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
