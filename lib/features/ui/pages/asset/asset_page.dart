import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tractian_technical_test/features/domain/entities/location.dart';
import 'package:tractian_technical_test/features/ui/pages/asset/components/location_item.dart';
import 'package:tractian_technical_test/features/ui/pages/asset/states/asset_state.dart';
import 'package:tractian_technical_test/features/ui/pages/asset/stores/asset_page_store.dart';
import 'package:tractian_technical_test/features/ui/widgets/custom_buttom.dart';
import 'package:tractian_technical_test/features/ui/widgets/custom_loading.dart';

class AssetPage extends StatefulWidget {
  const AssetPage({super.key});

  @override
  State<AssetPage> createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage> {
  Map args = {};

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        args = ModalRoute.of(context)!.settings.arguments as Map;
        context
            .read<AssetPageStore>()
            .fetchLocations(nameCompany: args['name']);
      },
    );

    super.initState();
  }

  bool onClickSensorEnergia = false;
  bool onClickCritical = false;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AssetPageStore>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const SizedBox(
          height: 30,
          child: Text("Assets"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color.fromRGBO(234, 239, 243, 1),
              margin: const EdgeInsets.all(8),
              height: 35,
              width: MediaQuery.of(context).size.width * 0.95,
              child: const TextField(
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.search, size: 20,),
                  hintText: "Buscar Ativo ou Local",
                  alignLabelWithHint: true,
                  border: InputBorder.none
                ),
                
              ),
            ),
            Row(
              children: [
                CustomButtom(
                  label: "Sensor de Energia",
                  onPressed: onClickCritical
                      ? () {}
                      : () {
                          setState(() =>
                              onClickSensorEnergia = !onClickSensorEnergia);
                        },
                  backgroundColor:
                      onClickSensorEnergia ? Colors.blue : Colors.transparent,
                  icon: Icon(
                    CupertinoIcons.bolt,
                    size: 15,
                    color: onClickSensorEnergia
                        ? Colors.white
                        : const Color.fromARGB(255, 82, 82, 82),
                  ),
                  textColor: onClickSensorEnergia
                      ? Colors.white
                      : const Color.fromARGB(255, 82, 82, 82),
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                CustomButtom(
                  width: 110,
                  label: "Crítico",
                  onPressed: onClickSensorEnergia
                      ? () {}
                      : () {
                          setState(() => onClickCritical = !onClickCritical);
                        },
                  backgroundColor:
                      onClickCritical ? Colors.blue : Colors.transparent,
                  icon: Icon(
                    CupertinoIcons.exclamationmark_circle,
                    size: 15,
                    color: onClickCritical
                        ? Colors.white
                        : const Color.fromARGB(255, 82, 82, 82),
                  ),
                  textColor: onClickCritical
                      ? Colors.white
                      : const Color.fromARGB(255, 82, 82, 82),
                )
              ],
            ),
            const Divider(
              color: Color.fromARGB(255, 219, 219, 219),
            ),
            ValueListenableBuilder(
              valueListenable: state,
              builder: (context, value, child) {
                if (value is SuccessAssetPageState) {
                  final List<LocationEntity> locations = value.locations;
                  final items = locations.map((location) {
                    return LocationItem(
                      location: location,
                      onClickCritical: onClickCritical,
                      onClickSensorEnergia: onClickSensorEnergia,
                    );
                  }).toList();
                  child = Column(
                    children: [...items],
                  );
                }

                if (value is LoadingAssetPageState) {
                  child = const CustomLoading();
                }

                return child ?? Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
