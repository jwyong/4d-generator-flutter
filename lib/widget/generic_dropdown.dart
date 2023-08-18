import 'package:flutter/material.dart';

class GenericDropdown extends StatelessWidget {
  const GenericDropdown({super.key, required this.title, this.iconData, this.shouldShowDropdownIcon = true, this.onTap});

  final String title;
  final IconData? iconData;
  final bool shouldShowDropdownIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.black12),
          padding: EdgeInsets.only(left: (shouldShowDropdownIcon ? 3 : 5), right: 10, top: 8, bottom: 8),
          child: Row(
            children: [
              // Dropdown arrow icon
              if (shouldShowDropdownIcon) const Icon(Icons.arrow_drop_down),

              // Icon
              if (iconData != null) Icon(iconData),

              const SizedBox(width: 5),

              // Title text
              Text(title)
            ],
          ),
        ));
  }
}
