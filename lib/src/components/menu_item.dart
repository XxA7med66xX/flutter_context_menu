import 'package:flutter/material.dart';

import '../core/models/context_menu_entry.dart';
import '../core/models/context_menu_item.dart';
import '../core/utils/extensions.dart';
import '../widgets/context_menu_state.dart';
import 'menu_divider.dart';
import 'menu_header.dart';

/// Represents a selectable item in a context menu.
///
/// This class is used to define individual items that can be displayed within
/// a context menu.
///
/// #### Parameters:
/// - [label] - The title of the context menu item
/// - [leadingIcon] - The icon of the context menu item.
/// - [trailingIcon] - The icon indicates that context menu 
///   includes sub-menu items.
/// - [constraints] - The height of the context menu item.
/// - [focusNode] - The focus node of the context menu item.
/// - [value] - The value associated with the context menu item.
/// - [items] - The list of subitems associated with the context menu item.
/// - [onSelected] - The callback that is triggered when the context menu item
///   is selected. If the item has subitems, it toggles the visibility of the
///   submenu. If not, it pops the current context menu and returns the
///   associated value.
/// - [constraints] - The constraints of the context menu item.
///
/// see:
/// - [ContextMenuEntry]
/// - [MenuHeader]
/// - [MenuDivider]
///
final class MenuItem<T> extends ContextMenuItem<T> {
  final String label;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final BoxConstraints? constraints;

  const MenuItem({
    required this.label,
    this.leadingIcon,
    super.value,
    super.onSelected,
    this.constraints,
  }) : trailingIcon = null;

  const MenuItem.submenu({
    required this.label,
    required List<ContextMenuEntry> items,
    this.leadingIcon,
    this.trailingIcon,
    super.onSelected,
    this.constraints,
  }) : super.submenu(items: items);

  @override
  Widget builder(BuildContext context, ContextMenuState menuState,
      [FocusNode? focusNode]) {
    bool isFocused = menuState.focusedEntry == this;

    final background = context.colorScheme.surface;
    final normalTextColor = Color.alphaBlend(
      context.colorScheme.onSurface.withOpacity(0.7),
      background,
    );
    final focusedTextColor = context.colorScheme.onSurface;
    final foregroundColor = isFocused ? focusedTextColor : normalTextColor;

    // ~~~~~~~~~~ //

    return ConstrainedBox(
      constraints: constraints ?? const BoxConstraints.expand(height: 32.0),
      child: Material(
        color: isFocused ? context.theme.focusColor.withAlpha(20) : background,
        borderRadius: menuState.style.borderRadius,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => handleItemSelection(context),
          canRequestFocus: false,
          child: Row(
            children: [
              if (leadingIcon != null) ...[
                _buildLeading(menuState, foregroundColor),
                SizedBox(width: menuState.style.horizontalTitleGap),
              ],
              if (leadingIcon == null) const SizedBox(width: 5),
              Expanded(
                child: Text(
                  label,
                  style: menuState.style.labelStyle!.copyWith(
                    color: foregroundColor,
                    height: 1.0,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              _buildTrailing(foregroundColor, isSubmenuItem, menuState),
            ],
          ),
        ),
      ),
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
