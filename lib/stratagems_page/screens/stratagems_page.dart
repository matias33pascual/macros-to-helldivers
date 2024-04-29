// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:macro_sync_client/shared/exports_shared.dart';
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
        backgroundColor: Colors.black,
        appBar: const CustomAppBar(title: "Estratagemas"),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              Image.asset(
                "assets/images/stratagems_background.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 700,
                child: FutureBuilder(
                  future: provider.loadStratagems(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.done:
                        return Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) => Container(
                                  height: 32,
                                  margin: EdgeInsets.symmetric(vertical: 3),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(137, 81, 95, 122),
                                    border: Border.all(
                                      color: AppTheme.colors.borderGray,
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 4),
                                      SkullIcon(width: 32),
                                      SizedBox(width: 8),
                                      SizedBox(
                                        width: 320,
                                        child: Text(
                                          snapshot.data[index].name,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: AppTheme.font,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                "SELECCIONADAS PARA MISION",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: AppTheme.font,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: 80, height: 80, color: Colors.amber),
                                SizedBox(width: 16),
                                Container(
                                    width: 80, height: 80, color: Colors.amber),
                                SizedBox(width: 16),
                                Container(
                                    width: 80, height: 80, color: Colors.amber),
                              ],
                            ),
                            SizedBox(height: 22),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: 80, height: 80, color: Colors.amber),
                                SizedBox(width: 16),
                                Container(
                                    width: 80, height: 80, color: Colors.amber),
                                SizedBox(width: 16),
                                Container(
                                    width: 80, height: 80, color: Colors.amber),
                                SizedBox(width: 16),
                                Container(
                                    width: 80, height: 80, color: Colors.amber),
                              ],
                            ),
                            SizedBox(height: 20),
                            CustomButton(
                                color: CustomButtonColors.yellow,
                                text: "COMENZAR MISION"),
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
      ),
    );
  }
}
