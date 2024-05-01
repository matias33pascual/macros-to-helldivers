import 'package:flutter/material.dart';
import 'package:macro_sync_client/shared/exports_shared.dart';
import 'package:macro_sync_client/stratagems_page/models/stratagems_menu_enum.dart';
import 'package:macro_sync_client/stratagems_page/providers/stratagems_provider.dart';
import 'package:macro_sync_client/stratagems_page/providers/tabs_menu_provider.dart';
import 'package:macro_sync_client/theme/app_theme.dart';
import 'package:provider/provider.dart';

class StratagemsScreen extends StatelessWidget {
  const StratagemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StratagemsProvider provider =
        Provider.of<StratagemsProvider>(context);

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
            _buildContent(provider),
          ],
        ),
      ),
    );
  }

  Container _buildContent(StratagemsProvider provider) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FutureBuilder(
        future: provider.loadStratagems(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              // if (snapshot.hasError) {
              //   return Container();
              // }

              return Column(
                children: [
                  _buildContentMenu(context),
                  // _buildContentList(context),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.amber, width: 1)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    child: const CustomText(
                        text: "SELECCIONADAS PARA MISION", size: 16),
                  ),
                  Flexible(
                    flex: 2,
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

  // Flexible _buildContentList(BuildContext context) {
  //   return Flexible(
  //     flex: 4,
  //     child: ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: snapshot.data.length,
  //       itemBuilder: (context, index) => Container(
  //         height: 32,
  //         margin: const EdgeInsets.symmetric(vertical: 2),
  //         decoration: BoxDecoration(
  //           color: index == 4
  //               ? Colors.green.withOpacity(0.6)
  //               : const Color.fromARGB(137, 81, 95, 122),
  //           border: Border.all(
  //             color: index == 4 ? Colors.green : Colors.white.withOpacity(0.2),
  //             width: 2,
  //           ),
  //         ),
  //         child: Row(
  //           children: [
  //             const SkullIcon(width: 32),
  //             Container(
  //               margin: const EdgeInsets.only(left: 8),
  //               constraints: const BoxConstraints(maxWidth: 300),
  //               child: CustomText(
  //                 text: snapshot.data[index].name,
  //                 size: 16,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Container _buildContentMenu(BuildContext context) {
    final TabsMenuProvider tabsMenuProviders =
        Provider.of<TabsMenuProvider>(context);

    final StratagemsProvider stratagemsProvider =
        Provider.of<StratagemsProvider>(context, listen: false);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _MenuTab(
            text: StratagemsMenuEnum.mission.getStringValue(),
            isSelected: tabsMenuProviders
                .isThisMenuSelected(StratagemsMenuEnum.mission),
            onTapHandler: () => stratagemsProvider.selectStratagemsList(
                StratagemsMenuEnum.mission, context),
          ),
          _MenuTab(
            text: StratagemsMenuEnum.defenses.getStringValue(),
            isSelected: tabsMenuProviders
                .isThisMenuSelected(StratagemsMenuEnum.defenses),
            onTapHandler: () => stratagemsProvider.selectStratagemsList(
                StratagemsMenuEnum.defenses, context),
          ),
          _MenuTab(
            text: StratagemsMenuEnum.eagle.getStringValue(),
            isSelected:
                tabsMenuProviders.isThisMenuSelected(StratagemsMenuEnum.eagle),
            onTapHandler: () => stratagemsProvider.selectStratagemsList(
                StratagemsMenuEnum.eagle, context),
          ),
          _MenuTab(
            text: StratagemsMenuEnum.orbital.getStringValue(),
            isSelected: tabsMenuProviders
                .isThisMenuSelected(StratagemsMenuEnum.orbital),
            onTapHandler: () => stratagemsProvider.selectStratagemsList(
                StratagemsMenuEnum.orbital, context),
          ),
          _MenuTab(
            text: StratagemsMenuEnum.weapons.getStringValue(),
            isSelected: tabsMenuProviders
                .isThisMenuSelected(StratagemsMenuEnum.weapons),
            onTapHandler: () => stratagemsProvider.selectStratagemsList(
                StratagemsMenuEnum.weapons, context),
          ),
          _MenuTab(
            text: StratagemsMenuEnum.backpacks.getStringValue(),
            isSelected: tabsMenuProviders
                .isThisMenuSelected(StratagemsMenuEnum.backpacks),
            onTapHandler: () => stratagemsProvider.selectStratagemsList(
                StratagemsMenuEnum.backpacks, context),
          ),
        ],
      ),
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

class _MenuTab extends StatelessWidget {
  final bool isSelected;
  final String text;
  final void Function()? onTapHandler;

  const _MenuTab({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return CustomText(
        text: text,
        strokeColor: Colors.black,
        textColor: Colors.amber,
        size: 14,
      );
    }

    return InkWell(onTap: onTapHandler, child: CustomText(text: text));
  }
}
