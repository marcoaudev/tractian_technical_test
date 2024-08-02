import 'package:flutter/cupertino.dart';

class CustomItem extends StatelessWidget {
  final Widget icon;
  final Widget name;
  final String id;
  final String? locationId;
  final String? parentId;
  final String? sensorType;
  final String? status;
  final bool? showNodes;

  const CustomItem({
    super.key,
    required this.icon,
    required this.name,
    required this.id,
    this.locationId,
    this.parentId,
    this.sensorType,
    this.status,
    this.showNodes,
  });

  @override
  Widget build(BuildContext context) {
    late dynamic iconChevron;

    if(showNodes != null){
      if(showNodes!){
        iconChevron = const Icon(CupertinoIcons.chevron_down, size: 15);
      }else{
        iconChevron = const Icon(CupertinoIcons.chevron_right, size: 15);
      }
    }else{
      iconChevron = Container();
    }


    return SizedBox(
      height: 35,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: iconChevron
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: icon,
          ),
          name
        ],
      ),
    );
  }
}
