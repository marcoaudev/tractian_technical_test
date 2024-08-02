import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tractian_technical_test/features/domain/entities/component.dart';
import 'package:tractian_technical_test/features/ui/widgets/custom_item.dart';

class ComponentItem extends StatelessWidget {
  final ComponentEntity component;
  final bool? onClickCritical;
  final bool? onClickSensorEnergia;

  const ComponentItem({
    super.key,
    required this.component,
    this.onClickCritical,
    this.onClickSensorEnergia,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = CustomItem(
          icon: SizedBox(
            height: 30,
            child: Image.asset('assets/component_icon.png'),
          ),
          name: Row(
            children: [
              Text(
                component.name,
                style: const TextStyle(fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(width: 5),
              component.sensorType == "energy"
                  ? const Icon(
                      CupertinoIcons.bolt_fill,
                      size: 15,
                      color: Colors.green,
                    )
                  : const Icon(
                      CupertinoIcons.circle_fill,
                      size: 10,
                      color: Colors.red,
                    )
            ],
          ),
          id: component.id,
        );

    if (onClickCritical != null && onClickCritical == true) {
      if (component.sensorType != "vibration") {
        child = Container();
      }
    } else if (onClickSensorEnergia != null && onClickSensorEnergia == true) {
      if (component.sensorType != "energy") {
        child = child = Container();
      } 
    }
    
    return child;
  }
}
