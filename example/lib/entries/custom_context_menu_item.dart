import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';

final class CustomContextMenuItem extends ContextMenuItem<String> {
  final String label;
  final String? subtitle;
  final IconData? icon;

  const CustomContextMenuItem({
    required this.label,
    super.value,
    super.onSelected,
    this.subtitle,
    this.icon,
  });

  const CustomContextMenuItem.submenu({
    required this.label,
    required super.items,
    this.subtitle,
    this.icon,
  }) : super.submenu();

  @override
  bool get isFocusMaintained => true;

  @override
  Widget builder(BuildContext context, ContextMenuState menuState,
      [FocusNode? focusNode]) {
    bool isFocused = menuState.focusedEntry == this;
        
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color background = colorScheme.surface;
    final Color normalTextColor = Color.alphaBlend(
      colorScheme.onSurface.withOpacity(0.7),
      background,
    );
    final Color focusedTextColor = colorScheme.onSurface;
    final Color foregroundColor = isFocused ? focusedTextColor : normalTextColor;
    
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      horizontalTitleGap: (menuState.style.horizontalTitleGap ?? 0) + 4,
      shape: RoundedRectangleBorder(
        borderRadius: menuState.style.borderRadius ?? const BorderRadius.all(Radius.zero),
      ),
      focusNode: focusNode, // important for highlighting item on focus
      title: SizedBox(
        width: double.maxFinite,
        child: Text(
          label,
          style: menuState.style.labelStyle!.copyWith(
            color: foregroundColor,
            height: 1.0,
          ),
        ),
      ),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      onTap: () => handleItemSelection(context),
      trailing: Icon(
        isSubmenuItem ? Icons.arrow_right : null,
        size: menuState.style.trailingIconSize,
      ),
      leading: SizedBox.square(
        dimension: 32.0,
        child: Icon(
          icon,
          size: menuState.style.leadingIconSize,
          color: foregroundColor,
        ),
      ),
      dense: false,
      selected: menuState.isOpened(this),
      selectedColor: Colors.white,
      selectedTileColor: Colors.blue,
    );
  }

  @override
  String get debugLabel => "[${hashCode.toString().substring(0, 5)}] $label";
}
