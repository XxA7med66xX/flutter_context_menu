import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/default_menu_shortcuts.dart';
import '../utils/helpers.dart';
import 'context_menu_entry.dart';

/// Represents a context menu data model.
class ContextMenu {
  /// The position of the context menu.
  Offset? position;

  /// The entries of the context menu.
  final List<ContextMenuEntry> entries;

  /// A class that holds all style properties of contextMenu.
  final ContextMenuStyle style;

  /// The maximum width of the context menu.
  ///
  /// Defaults to 350.0
  final double maxWidth;

  /// The clip behavior of the context menu.
  ///
  /// Defaults to [Clip.antiAlias]
  final Clip clipBehavior;

  /// A map of shortcuts to be bound to the context menu and the nested context menus.
  ///
  /// Note: This overides the default shortcuts in [defaultMenuShortcuts] if any of the keys match.
  Map<ShortcutActivator, VoidCallback> shortcuts;

  ContextMenu({
    required this.entries,
    this.position,
    required this.style,
    double? maxWidth,
    Clip? clipBehavior,
    Map<ShortcutActivator, VoidCallback>? shortcuts,
  })  : maxWidth = maxWidth ?? 350.0,
        clipBehavior = clipBehavior ?? Clip.antiAlias,
        shortcuts = shortcuts ?? const {};
        

  /// A shortcut method to show the context menu.
  ///
  /// For a more customized context menu, use [showContextMenu]
  Future<T?> show<T>(BuildContext context) {
    return showContextMenu(context, contextMenu: this);
  }

  ContextMenu copyWith({
    Offset? position,
    List<ContextMenuEntry>? entries,
    ContextMenuStyle? style,
    EdgeInsets? padding,
    BorderRadiusGeometry? borderRadius,
    double? maxWidth,
    Clip? clipBehavior,
    BoxDecoration? boxDecoration,
  }) {
    return ContextMenu(
      position: position ?? this.position,
      entries: entries ?? this.entries,
      style: style ?? this.style,
      maxWidth: maxWidth ?? this.maxWidth,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }
}

class ContextMenuStyle {
  /// The label style of the context menu.
  final TextStyle? labelStyle;

  /// The leading icon size of the context menu.
  final double? leadingIconSize;
  
  /// The trailing icon size of the context menu.
  final double? trailingIconSize;

  /// The padding of the context menu.
  ///
  /// Defaults to [EdgeInsets.all(4.0)]
  final EdgeInsets padding;

  /// The gap between menu icon and label or sub-title if exist.
  final double? horizontalTitleGap;

  /// The border radius around the context menu.
  final BorderRadiusGeometry? borderRadius;

  /// The decoration of the context menu.
  final BoxDecoration? boxDecoration;

  ContextMenuStyle({
    this.labelStyle = const TextStyle(),
    this.leadingIconSize = 16,
    this.trailingIconSize = 16,
    this.padding = const EdgeInsets.all(5),
    this.horizontalTitleGap,
    this.borderRadius,
    this.boxDecoration,
  });

  ContextMenuStyle copyWith({
    TextStyle? labelStyle,
    double? leadingIconSize,
    double? trailingIconSize,
    EdgeInsets? padding,
    double? horizontalTitleGap,
    BorderRadiusGeometry? borderRadius,
    BoxDecoration? boxDecoration,
  }) {
    return ContextMenuStyle(
      labelStyle: labelStyle ?? this.labelStyle,
      leadingIconSize: leadingIconSize ?? this.leadingIconSize,
      trailingIconSize: trailingIconSize ?? this.trailingIconSize,
      padding: padding ?? this.padding,
      horizontalTitleGap: horizontalTitleGap ?? this.horizontalTitleGap,
      borderRadius: borderRadius ?? this.borderRadius,
      boxDecoration: boxDecoration ?? this.boxDecoration,
    );
  }
}
