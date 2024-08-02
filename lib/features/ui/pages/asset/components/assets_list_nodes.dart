import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tractian_technical_test/features/domain/entities/asset.dart';
import 'package:tractian_technical_test/features/domain/entities/component.dart';
import 'package:tractian_technical_test/features/ui/pages/asset/components/asset_item.dart';
import 'package:tractian_technical_test/features/ui/pages/asset/components/component_item.dart';
import 'package:tractian_technical_test/features/ui/pages/asset/stores/assets_store.dart';
import 'package:tractian_technical_test/features/ui/pages/asset/stores/components_store.dart';

class ListNodesAssets extends StatefulWidget {
  final String id;
  final bool? onClickCritical;
  final bool? onClickSensorEnergia;

  const ListNodesAssets({
    super.key,
    required this.id,
    this.onClickCritical,
    this.onClickSensorEnergia,
  });

  @override
  State<ListNodesAssets> createState() => _ListNodesAssetsState();
}

class _ListNodesAssetsState extends State<ListNodesAssets> {
  @override
  Widget build(BuildContext context) {
    final List<AssetEntity> assets = context.read<AssetsStore>().fetchAssetsFromAssetId(id: widget.id);
    final List<ComponentEntity> components = context.read<ComponentsStore>().fetchComponentsFromAssetId(id: widget.id);

    List assetsWidget = [];

    assetsWidget = assets.map(
      (asset) {
        return AssetItem(
          asset: asset,
          onClickCritical: widget.onClickCritical,
          onClickSensorEnergia: widget.onClickSensorEnergia,
        );
      },
    ).toList();
    List componentsWidget = [];

    componentsWidget = components.map(
      (component) {
        return ComponentItem(
          component: component,
          onClickCritical: widget.onClickCritical,
          onClickSensorEnergia: widget.onClickSensorEnergia,
        );
      },
    ).toList();

    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          ...assetsWidget,
          ...componentsWidget,
        ],
      ),
    );
  }
}