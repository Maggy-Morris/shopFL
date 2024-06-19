import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/borders.dart' as painting;

import '../constants/colors.dart';

Widget multiSelectGenericDropdown<T>({
  required bool isEnabled,
  required bool isRequired,
  String? titleName,
  bool showSearch = false,
  bool filled = false,
  List<T>? selectedItem,
  required List<T> itemsList,
  // GlobalKey<DropdownSearchState<DropDownModel>>? formKey,
  void Function(List<T>?)? onChanged,
  Widget? iconWidget,
  Function()? onClear,
  String Function(T)? itemAsString,
}) {
  return DropdownSearch<T>.multiSelection(
    // key: formKey,
    items: itemsList,
    itemAsString: itemAsString,
    onChanged: onChanged,
    selectedItems: selectedItem ?? [],
    enabled: isEnabled,
    clearButtonProps: ClearButtonProps(
        color: MyColors.red,
        icon: const Icon(Icons.clear),
        onPressed: onClear,
        isVisible: (onClear != null) ? true : false),
    dropdownButtonProps: const DropdownButtonProps(
      color: Colors.black,
      splashRadius: 0.1,
    ),
    dropdownDecoratorProps: DropDownDecoratorProps(
      dropdownSearchDecoration: InputDecoration(
        hintText: titleName,
        label: (titleName?.isNotEmpty ?? false) ? Text(titleName ?? "") : null,
        isDense: false,
        hintStyle: const TextStyle(color: Color(0x30171725)),
        contentPadding: const EdgeInsets.all(10),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        errorText: (isRequired) ? 'Required' : null,
        prefixIcon: iconWidget,
        filled: filled,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(style: painting.BorderStyle.none)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(style: painting.BorderStyle.none)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(style: painting.BorderStyle.none)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                style: painting.BorderStyle.none, color: Colors.black12)),
      ),
    ),
    popupProps: PopupPropsMultiSelection.menu(
      showSearchBox: showSearch,
      fit: FlexFit.loose,
      menuProps: MenuProps(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.hardEdge,
      ),
      searchDelay: Duration.zero,
      listViewProps: const ListViewProps(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      ),
      searchFieldProps: TextFieldProps(
        padding: const EdgeInsets.all(20),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          filled: true,
          fillColor: Colors.grey.shade200,
          isDense: true,
          suffixIcon: const Icon(Icons.search, color: MyColors.red),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(style: painting.BorderStyle.none)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(style: painting.BorderStyle.none)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(style: painting.BorderStyle.none)),
        ),
      ),
    ),
  );
}

Widget singleSelectGenericDropdown<T>({
  required bool isEnabled,
  required bool isRequired,
  String? titleName,
  bool showSearch = false,
  List<T> itemsList = const [],
  void Function(T?)? onChanged,
  Widget? iconWidget,
  Function()? onClear,
  T? selectedItem,
  String Function(T)? itemAsString,
  Future<List<T>> Function(String)? asyncItems,
  bool Function(T, String)? filterFn,
  bool? filled,
}) {
  return Directionality(
    textDirection: TextDirection.rtl, // Set text direction to RTL
    child: DropdownSearch<T>(
      items: itemsList,
      asyncItems: asyncItems,
      itemAsString: itemAsString,
      selectedItem: selectedItem,
      onChanged: onChanged,
      enabled: isEnabled,
      clearButtonProps: ClearButtonProps(
        color: MyColors.red,
        icon: const Icon(Icons.clear),
        onPressed: onClear,
        isVisible: (onClear != null) ? true : false,
      ),
      dropdownButtonProps: const DropdownButtonProps(
        color: MyColors.lightText,
        splashRadius: 0.1,
      ),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          hintText: titleName,
          // label:
          //     (titleName?.isNotEmpty ?? false) ? Text(titleName ?? "") : null,
          isDense: false,
          hintStyle: const TextStyle(color: MyColors.lightText),
          contentPadding: const EdgeInsets.all(10),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          errorText: (isRequired) ? 'Required' : null,
          suffixIcon: iconWidget, // Changed back to suffixIcon for RTL
          filled: filled,
          fillColor: MyColors.white, // Set the color to white
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(style: painting.BorderStyle.none),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(style: painting.BorderStyle.none),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(style: painting.BorderStyle.none),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              style: painting.BorderStyle.none,
              color: Colors.black12,
            ),
          ),
        ),
      ),
      popupProps: PopupPropsMultiSelection.menu(
        showSearchBox: showSearch,
        fit: FlexFit.loose,
        menuProps: MenuProps(
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.hardEdge,
        ),
        searchDelay: Duration.zero,
        listViewProps: const ListViewProps(
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        ),
        itemBuilder: (context, item, isSelected) {
          return Directionality(
            textDirection: TextDirection.rtl, // Ensure RTL for list items
            child: ListTile(
              title: Text(itemAsString?.call(item) ?? item.toString()),
              selected: isSelected,
            ),
          );
        },
        searchFieldProps: TextFieldProps(
          padding: const EdgeInsets.all(20),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            filled: true,
            fillColor: MyColors.onBackground, // Set the color to white
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(style: painting.BorderStyle.none),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(style: painting.BorderStyle.none),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(style: painting.BorderStyle.none),
            ),
          ),
        ),
      ),
    ),
  );
}


// Widget singleSelectGenericDropdown<T>({
//   required bool isEnabled,
//   required bool isRequired,
//   String? titleName,
//   bool showSearch = false,
//   List<T> itemsList = const [],
//   // GlobalKey<DropdownSearchState<DropDownModel>>? formKey,
//   void Function(T?)? onChanged,
//   Widget? iconWidget,
//   Function()? onClear,
//   T? selectedItem,
//   String Function(T)? itemAsString,
//   Future<List<T>> Function(String)? asyncItems,
//   bool Function(T, String)? filterFn,
//   bool? filled,
// }) {
//   return DropdownSearch<T>(
//     // key: formKey,
//     items: itemsList,
//     asyncItems: asyncItems,
//     itemAsString: itemAsString,
//     selectedItem: selectedItem,
//     onChanged: onChanged,
//     enabled: isEnabled,
//     clearButtonProps: ClearButtonProps(
//         color: MyColors.red,
//         icon: const Icon(Icons.clear),
//         onPressed: onClear,
//         isVisible: (onClear != null) ? true : false),
//     dropdownButtonProps: const DropdownButtonProps(
//       color: MyColors.lightText,
//       splashRadius: 0.1,
//     ),
//     dropdownDecoratorProps: DropDownDecoratorProps(
//       dropdownSearchDecoration: InputDecoration(
//         hintText: titleName,
//         label: (titleName?.isNotEmpty ?? false) ? Text(titleName ?? "") : null,
//         isDense: false,
//         hintStyle: const TextStyle(color: MyColors.lightText),
//         contentPadding: const EdgeInsets.all(10),
//         floatingLabelAlignment: FloatingLabelAlignment.start,
//         errorText: (isRequired) ? 'Required' : null,
//         suffixIcon: iconWidget,
//         filled: filled,
//         fillColor: MyColors.white,
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: const BorderSide(style: painting.BorderStyle.none)),
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: const BorderSide(style: painting.BorderStyle.none)),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: const BorderSide(style: painting.BorderStyle.none)),
//         disabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: const BorderSide(
//                 style: painting.BorderStyle.none, color: Colors.black12)),
//       ),
//     ),
//     popupProps: PopupPropsMultiSelection.menu(
//       showSearchBox: showSearch,
//       fit: FlexFit.loose,
//       menuProps: MenuProps(
//         borderRadius: BorderRadius.circular(10),
//         clipBehavior: Clip.hardEdge,
//       ),
//       searchDelay: Duration.zero,
//       listViewProps: const ListViewProps(
//         padding: EdgeInsets.zero,
//         physics: BouncingScrollPhysics(),
//         shrinkWrap: true,
//         keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//       ),
//       searchFieldProps: TextFieldProps(
//         padding: const EdgeInsets.all(20),
//         decoration: InputDecoration(
//           contentPadding: const EdgeInsets.all(10),
//           filled: true,
//           fillColor: MyColors.white,
//           isDense: true,
//           // suffixIcon: const Icon(Icons.search, color: MyColors.red),
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: const BorderSide(style: painting.BorderStyle.none)),
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: const BorderSide(style: painting.BorderStyle.none)),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: const BorderSide(style: painting.BorderStyle.none)),
//         ),
//       ),
//     ),
//     // dropdownDecoratorProps: DropDownDecoratorProps(
//     //   dropdownSearchDecoration: InputDecoration(
//     //     hintText: titleName,
//     //     isDense: true,
//     //     hintStyle: const TextStyle(color: Color(0x30171725)),
//     //     contentPadding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
//     //     floatingLabelAlignment: FloatingLabelAlignment.start,
//     //     errorText: (isRequired) ? 'Required' : null,
//     //     prefixIcon: iconWidget,
//     //     filled: true,
//     //     fillColor: Colors.grey.shade200,
//     //     border: OutlineInputBorder(
//     //         borderRadius: BorderRadius.circular(10),
//     //         borderSide: const BorderSide(style: painting.BorderStyle.none)),
//     //     enabledBorder: OutlineInputBorder(
//     //         borderRadius: BorderRadius.circular(10),
//     //         borderSide: const BorderSide(style: painting.BorderStyle.none)),
//     //     focusedBorder: OutlineInputBorder(
//     //         borderRadius: BorderRadius.circular(10),
//     //         borderSide: const BorderSide(style: painting.BorderStyle.none)),
//     //     disabledBorder: OutlineInputBorder(
//     //         borderRadius: BorderRadius.circular(10),
//     //         borderSide: const BorderSide(style: painting.BorderStyle.none)),
//     //   ),
//     // ),
//     // popupProps: PopupPropsMultiSelection.menu(
//     //   showSearchBox: showSearch,
//     //   fit: FlexFit.loose,
//     //   menuProps: MenuProps(
//     //     borderRadius: BorderRadius.circular(10),
//     //     clipBehavior: Clip.hardEdge,
//     //   ),
//     //   searchDelay: Duration.zero,
//     //   listViewProps: const ListViewProps(
//     //     padding: EdgeInsets.zero,
//     //     physics: BouncingScrollPhysics(),
//     //     shrinkWrap: true,
//     //     keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//     //   ),
//     //   searchFieldProps: TextFieldProps(
//     //     padding: const EdgeInsets.all(20),
//     //     decoration: InputDecoration(
//     //       contentPadding: const EdgeInsets.all(10),
//     //       filled: true,
//     //       fillColor: Colors.grey.shade200,
//     //       isDense: true,
//     //       suffixIcon: const Icon(Icons.search, color: AppColors.thinkRedColor),
//     //       border: OutlineInputBorder(
//     //           borderRadius: BorderRadius.circular(10),
//     //           borderSide: const BorderSide(style: painting.BorderStyle.none)),
//     //       enabledBorder: OutlineInputBorder(
//     //           borderRadius: BorderRadius.circular(10),
//     //           borderSide: const BorderSide(style: painting.BorderStyle.none)),
//     //       focusedBorder: OutlineInputBorder(
//     //           borderRadius: BorderRadius.circular(10),
//     //           borderSide: const BorderSide(style: painting.BorderStyle.none)),
//     //     ),
//     //   ),
//     // ),
//   );
// }
