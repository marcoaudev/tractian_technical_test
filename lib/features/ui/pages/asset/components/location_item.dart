import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tractian_technical_test/features/domain/entities/asset.dart';
import 'package:tractian_technical_test/features/domain/entities/location.dart';
import 'package:tractian_technical_test/features/ui/pages/asset/components/asset_item.dart';
import 'package:tractian_technical_test/features/ui/pages/asset/stores/assets_store.dart';
import 'package:tractian_technical_test/features/ui/pages/asset/stores/locations_store.dart';
import 'package:tractian_technical_test/features/ui/widgets/custom_item.dart';

class LocationItem extends StatefulWidget {
  final LocationEntity location;
  final bool? onClickSensorEnergia;
  final bool? onClickCritical;

  const LocationItem({
    super.key,
    required this.location,
    this.onClickSensorEnergia,
    this.onClickCritical,
  });

  @override
  State<LocationItem> createState() => _LocationItemState();
}

class _LocationItemState extends State<LocationItem> {
  bool showNodes = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() => showNodes = !showNodes);
          },
          child: CustomItem(
            icon: const Icon(
              Icons.location_on_outlined,
              color: Colors.blue,
            ),
            name: Text(
              widget.location.name,
              style: const TextStyle(fontWeight: FontWeight.w400),
              overflow: TextOverflow.ellipsis,
            ),
            id: widget.location.id,
            showNodes: showNodes,
          ),
        ),
        if (showNodes)
          ListNodesLocations(
            id: widget.location.id,
            onClickCritical: widget.onClickCritical,
            onClickSensorEnergia: widget.onClickSensorEnergia,
          )
      ],
    );
  }
}

class ListNodesLocations extends StatefulWidget {
  final String id;
  final bool? onClickSensorEnergia;
  final bool? onClickCritical;

  const ListNodesLocations({
    super.key,
    required this.id,
    this.onClickSensorEnergia,
    this.onClickCritical,
  });

  @override
  State<ListNodesLocations> createState() => _ListNodesLocationsState();
}

class _ListNodesLocationsState extends State<ListNodesLocations> {
  @override
  Widget build(BuildContext context) {
    List<LocationEntity> locations = [];
    List<AssetEntity> assets = [];

    locations =
        context.read<LocationStore>().fetchLocationFromId(id: widget.id);
    assets = context.read<AssetsStore>().fetchAssetsFromId(id: widget.id);

    List locationsWidget = [];
    List assetsWidget = [];

    locationsWidget = locations.map(
      (location) {
        return LocationItem(
          location: location,
          onClickCritical: widget.onClickCritical,
          onClickSensorEnergia: widget.onClickSensorEnergia,
        );
      },
    ).toList();

    assetsWidget = assets.map(
      (asset) {
        return AssetItem(
          asset: asset,
          onClickCritical: widget.onClickCritical,
          onClickSensorEnergia: widget.onClickSensorEnergia,
        );
      },
    ).toList();

    return Container(
      margin: const EdgeInsets.only(left: 15),
      child: Column(
        children: [
          ...locationsWidget,
          ...assetsWidget,
        ],
      ),
    );
  }
}
