import 'package:flutter/material.dart';
import 'package:macro_sync_client/shared/exports_shared.dart';
import 'package:macro_sync_client/stratagems_page/providers/stratagems_provider.dart';
import 'package:macro_sync_client/stratagems_page/widgets/stratagems_list_widget.dart';
import 'package:macro_sync_client/stratagems_page/widgets/tab_menu_widget.dart';
import 'package:macro_sync_client/theme/app_theme.dart';
import 'package:provider/provider.dart';

class StratagemsScreen extends StatelessWidget {
  const StratagemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar:
            CustomAppBar(title: "Estratagemas", color: AppTheme.colors.darkRed),
        body: Stack(
          children: [
            _buildBackground(context),
            _buildPanel(context),
            _buildContent(context),
          ],
        ),
      ),
    );
  }

  Container _buildContent(BuildContext context) {
    final StratagemsProvider provider = Provider.of<StratagemsProvider>(
      context,
      listen: false,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FutureBuilder(
        future: provider.loadStratagems(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Container();
              }

              return Column(
                children: [
                  const TabMenuWidget(),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Container(
                      color: Colors.black.withOpacity(0.6),
                      child: const StratagemsListWidget(),
                    ),
                  ),
                  _buildHorizontalDivider(),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    child: const CustomText(
                        text: "SELECCIONADAS PARA MISION", size: 16),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      children: [
                        _buildSelectedGeneralStratagems(),
                        Expanded(child: Container()),
                        _buildSelectedSpecificStratagems(),
                        Expanded(child: Container()),
                        const CustomButton(
                            color: CustomButtonColors.yellow, text: "COMENZAR"),
                        Expanded(child: Container()),
                      ],
                    ),
                  )
                ],
              );
            case ConnectionState.waiting:
              return Stack(
                children: [
                  _buildBackground(context),
                  LinearProgressIndicator(
                    color:
                        const Color.fromARGB(255, 148, 0, 57).withOpacity(0.4),
                    backgroundColor: AppTheme.colors.darkRed,
                  ),
                ],
              );

            default:
              return Container();
          }
        },
      ),
    );
  }

  Container _buildHorizontalDivider() {
    return Container(
      margin: const EdgeInsets.only(top: 2),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.amber, width: 1)),
      ),
    );
  }

  Row _buildSelectedSpecificStratagems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            border: Border.all(
              color: Colors.amber.withOpacity(
                0.6,
              ),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            border: Border.all(
              color: Colors.amber.withOpacity(
                0.6,
              ),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            border: Border.all(
              color: Colors.amber.withOpacity(
                0.6,
              ),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            border: Border.all(
              color: Colors.amber.withOpacity(
                0.6,
              ),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
      ],
    );
  }

  Row _buildSelectedGeneralStratagems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amber),
          ),
          child: const SkullIcon(width: 40),
        ),
        const SizedBox(width: 16),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            border: Border.all(
              color: Colors.amber.withOpacity(
                0.6,
              ),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            border: Border.all(
              color: Colors.amber.withOpacity(
                0.6,
              ),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
      ],
    );
  }

  Container _buildPanel(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black.withOpacity(0.1),
    );
  }

  _buildBackground(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/stratagems_background.jpg",
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
