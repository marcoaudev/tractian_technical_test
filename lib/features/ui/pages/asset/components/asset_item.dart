import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tractian_technical_test/features/domain/entities/asset.dart';
import 'package:tractian_technical_test/features/ui/pages/asset/components/assets_list_nodes.dart';
import 'package:tractian_technical_test/features/ui/widgets/custom_item.dart';

class AssetItem extends StatefulWidget {
  final AssetEntity asset;
  final bool? onClickCritical;
  final bool? onClickSensorEnergia;

  const AssetItem({
    super.key,
    required this.asset,
    this.onClickCritical,
    this.onClickSensorEnergia,
  });

  @override
  State<AssetItem> createState() => _AssetItemState();
}

class _AssetItemState extends State<AssetItem> {
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
              CupertinoIcons.cube,
              color: Colors.blue,
            ),
            name: Text(
              widget.asset.name,
              style: const TextStyle(fontWeight: FontWeight.w400),
              overflow: TextOverflow.ellipsis,
            ),
            id: widget.asset.id,
            showNodes: showNodes,
          ),
        ),
        if (showNodes)
          ListNodesAssets(
            id: widget.asset.id,
            onClickCritical: widget.onClickCritical,
            onClickSensorEnergia: widget.onClickSensorEnergia,
          )
      ],
    );
  }
}
