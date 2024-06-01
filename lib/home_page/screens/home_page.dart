import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:macro_sync_client/home_page/providers/exports_providers.dart';
import 'package:macro_sync_client/home_page/screens/widgets/exports_widgets.dart';
import 'package:macro_sync_client/shared/services/connection_service.dart';
import 'package:macro_sync_client/shared/ui/exports_shared.dart';
import 'package:macro_sync_client/stratagems_page/screens/stratagems_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static String routeName = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final HomeProvider homeProvider = Provider.of<HomeProvider>(
      context,
      listen: false,
    );

    homeProvider.loadDataFromLocalStorate(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HomeProvider provider = Provider.of<HomeProvider>(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            _buildBackground(context),
            _buildMacroSyncTitle(),
            if (provider.state.error) _buildMessageInfo(),
            if (provider.state.isLoading) _buildLoadingWidget(context),
            _buildHelldiversTitle(),
            _buildForm(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingWidget(BuildContext context) {
    return Positioned(
      top: 310,
      height: 4,
      width: MediaQuery.of(context).size.width,
      child: const LinearProgressIndicator(
        backgroundColor: Colors.white,
        color: Colors.amber,
      ),
    );
  }

  Widget _buildMessageInfo() {
    return Container(
      padding: const EdgeInsets.only(top: 210, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                border: Border.all(color: Colors.amber),
              ),
              child: const CustomText(
                  maxLines: 4,
                  size: 13,
                  textAlign: TextAlign.justify,
                  text:
                      "No fue posible realizar la conexion. Compruebe que la DIRECCION IP y EL PUERTO sean los mismos que figuran en MacroSync Desktop Helldivers."),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildHelldiversTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/helldivers_title.png",
                width: 260,
                color: Colors.amber[400],
              ),
            ],
          )
        ],
      ),
    );
  }

  Padding _buildMacroSyncTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: "Macro Sync Mobile",
            size: 20,
            textColor: Colors.amber[400]!,
            strokeColor: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
    );
  }

  Image _buildBackground(BuildContext context) {
    return Image.asset(
      "assets/images/home_background.png",
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
    );
  }

  _buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              _buildPanel(),
              _buildContent(context),
            ],
          ),
        ],
      ),
    );
  }

  _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Column(
        children: [
          _buildDivisor(),
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: const CustomForm(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: GestureDetector(
              onTap: () {
                final HomeProvider provider =
                    Provider.of<HomeProvider>(context, listen: false);

                if (provider.state.port.isEmpty ||
                    provider.state.ipAddrress.isEmpty ||
                    provider.state.isLoading) {
                  return;
                }

                try {
                  ConnectionService.instance
                      .connectToServer(
                    provider.state.ipAddrress,
                    provider.state.port,
                    context,
                  )
                      .then(
                    (value) {
                      if (value) {
                        Navigator.pushNamed(context, StratagemsPage.routeName);
                      } else {
                        if (kDebugMode) {
                          print(
                              "No se pudo conectar al servidor: ConnectionService return false.");
                        }
                        provider.setMessageError(true);
                      }
                    },
                  ).onError(
                    (error, stackTrace) => throw Exception(error),
                  );
                } catch (error) {
                  if (kDebugMode) {
                    print("No se pudo conectar al servidor: $error.");
                  }
                  provider.setMessageError(true);
                }
              },
              child: const ConnectButton(),
            ),
          )
        ],
      ),
    );
  }

  Container _buildDivisor() {
    return Container(
      padding: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.amber[500]!.withOpacity(0.6),
            width: 2,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomText(
              text: "INGRESA LOS DATOS DE MACRO SYNC DESKTOP",
              size: 18,
              maxLines: 2,
              textColor: Colors.white,
              strokeColor: Colors.black.withOpacity(0.7),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  _buildPanel() {
    return Container(
      height: 222,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        border: Border.all(
          color: Colors.amber[500]!.withOpacity(0.6),
          width: 2,
          strokeAlign: StrokeAlign.inside,
        ),
      ),
    );
  }
}
