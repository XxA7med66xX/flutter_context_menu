import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';

final class CustomContextMenuItem extends ContextMenuItem<String> {
  final String label;
  final String? subtitle;
  final Widget? leadingIcon;
  final Widget? trailingIcon;

  const CustomContextMenuItem({
    required this.label,
    super.value,
    super.onSelected,
    this.subtitle,
    this.leadingIcon,
  }) : trailingIcon = null;

  const CustomContextMenuItem.submenu({
    required this.label,
    required super.items,
    this.subtitle,
    this.leadingIcon,
    this.trailingIcon,
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
      contentPadding: leadingIcon != null ? EdgeInsets.zero : const EdgeInsets.symmetric(horizontal: 5),
      horizontalTitleGap: (menuState.style.horizontalTitleGap ?? 0) + 4,
      shape: RoundedRectangleBorder(
        borderRadius: menuState.style.borderRadius ?? const BorderRadius.all(Radius.zero),
      ),
      focusNode: focusNode, // important for highlighting item on focus
      title: Text(
        label,
        style: menuState.style.labelStyle!.copyWith(
          color: foregroundColor,
          height: 1.0,
        ),
      ),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      onTap: () => handleItemSelection(context),
      trailing: _buildTrailing(foregroundColor, isSubmenuItem, menuState),
      leading: switch (leadingIcon) {
        null => null,
        (_) => _buildLeading(menuState, foregroundColor),
      },
      dense: false,
      selected: menuState.isOpened(this),
      selectedColor: Colors.white,
      selectedTileColor: Colors.blue,
    );
  }

  Widget _buildLeading(
    ContextMenuState menuState,
    Color foregroundColor,
  ) {
    if (isWidgetIcon(leadingIcon)) {
      Icon icon = (leadingIcon as Icon);

      return buildIcon(
        icon: icon.icon,
        size: icon.size,
        foregroundColor: foregroundColor,
        menuState: menuState,
        isLeading: true,
      );
    } else {
      return leadingIcon ?? const SizedBox.shrink();
    }
  }

  Widget _buildTrailing(
    Color foregroundColor,
    bool isSubmenuItem,
    ContextMenuState menuState,
  ) {
    if (isWidgetIcon(trailingIcon)) {
      final Icon icon = (trailingIcon as Icon);

      return buildIcon(
        icon: icon.icon!,
        size: icon.size,
        foregroundColor: foregroundColor,
        menuState: menuState,
        isLeading: false,
      );
    }
    return trailingIcon ?? buildIcon(
      icon: Icons.arrow_right,
      foregroundColor: foregroundColor,
      menuState: menuState,
      isLeading: false,
    );
  }

  @override
  String get debugLabel => "[${hashCode.toString().substring(0, 5)}] $label";
}
