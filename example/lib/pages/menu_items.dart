import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';

import '../entries/custom_context_menu_item.dart';

const defaultContextMenuItems = <ContextMenuEntry>[
  MenuItem.submenu(
    label: "New",
    leadingIcon: Icon(Icons.add_rounded),
    items: [
      MenuItem(
        label: "Node",
        value: "Node",
      ),
      MenuItem(
        label: "Item",
        value: "Item",
      ),
      MenuItem(
        label: "Group",
        value: "Group",
      ),
    ],
  ),
  MenuItem(
    label: "Open...",
    value: "Open...",
    leadingIcon: Icon(Icons.file_open_rounded)
  ),
  MenuItem.submenu(
    label: "View",
    leadingIcon: Icon(Icons.view_comfy_alt_rounded),
    items: [
      MenuHeader(text: "Visibility"),
      MenuItem(
        label: "Comapct",
        value: "Comapct",
        leadingIcon: Icon(Icons.view_compact_rounded),
      ),
      MenuItem(
        label: "Comfortable",
        value: "Comfortable",
        leadingIcon: Icon(Icons.view_comfortable_rounded),
      ),
      MenuDivider(),
      MenuItem.submenu(
          label: "Show Mini Map",
          leadingIcon: Icon(Icons.screen_search_desktop_rounded),
          items: [
            MenuItem(
              label: "Show",
              value: "Show",
            ),
            MenuItem(
              label: "Hide",
              value: "Hide",
            ),
            MenuItem.submenu(label: "Position", items: [
              MenuItem(
                label: "Left",
                value: "Left",
              ),
              MenuItem(
                label: "Right",
                value: "Right",
              ),
              MenuItem(
                label: "Top",
                value: "Top",
              ),
              MenuItem(
                label: "Bottom",
                value: "Bottom",
              ),
              MenuItem(
                label: "Center",
                value: "Center",
              ),
            ]),
          ]),
    ],
  ),
];

const customContextMenuItems = <ContextMenuEntry>[
  CustomContextMenuItem(
    label: "SPIRO SPATHIS",
    value: "SPIRO SPATHIS",
    subtitle: "First Soda Water in Egypt – Since 1920",
    leadingIcon: Icon(Icons.local_drink_rounded,)
  ),
  CustomContextMenuItem.submenu(
    label: "Food",
    leadingIcon: Icon(Icons.dining_rounded),
    items: [
      CustomContextMenuItem.submenu(
        label: "Fruits",
        subtitle: "Healthy",
        items: [
          CustomContextMenuItem(
            label: "Apple",
            value: "Apple",
            subtitle: "Red",
            leadingIcon: Icon(Icons.star_rounded)
          ),
          CustomContextMenuItem(
            label: "Orange",
            value: "Orange",
            subtitle: "Orange",
            leadingIcon: Icon(Icons.star_rounded),
          ),
          CustomContextMenuItem(
            label: "Banana",
            value: "Banana",
            subtitle: "Yellow",
            leadingIcon: Icon(Icons.star_rounded),
          ),
          CustomContextMenuItem(
            label: "Strawberry",
            value: "Strawberry",
            subtitle: "Red",
            leadingIcon: Icon(Icons.star_rounded),
          ),
          CustomContextMenuItem(
            label: "Watermelon",
            value: "Watermelon",
            subtitle: "Green",
            leadingIcon: Icon(Icons.star_rounded),
          )
        ],
      ),
      CustomContextMenuItem.submenu(
        label: "Vegetables",
        subtitle: "Healthier",
        items: [
          CustomContextMenuItem(
            label: "Carrot",
            value: "Carrot",
            subtitle: "Orange",
            leadingIcon: Icon(Icons.star_rounded),
          ),
          CustomContextMenuItem.submenu(
              label: "Potato",
              subtitle: "Brown",
              leadingIcon: Icon(Icons.star_rounded),
              items: [
                CustomContextMenuItem(
                  label: "Sweet",
                  value: "Sweet",
                  subtitle: "Sweet",
                  leadingIcon: Icon(Icons.star_rounded),
                ),
                CustomContextMenuItem(
                  label: "Sour",
                  value: "Sour",
                  subtitle: "Sour",
                  leadingIcon: Icon(Icons.star_rounded),
                ),
                CustomContextMenuItem(
                  label: "Salty",
                  value: "Salty",
                  subtitle: "Salty",
                  leadingIcon: Icon(Icons.star_rounded),
                ),
              ]),
          CustomContextMenuItem(
            label: "Cucumber",
            value: "Cucumber",
            subtitle: "Green",
            leadingIcon: Icon(Icons.star_rounded),
          ),
        ],
      ),
    ],
  ),
];
