
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDownBtn extends StatelessWidget {
  const DropDownBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            'Select Item',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: ['item1', 'item2', 'item3']
              .map((String item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ))
              .toList(),
          value: 'item1',
          onChanged: (String? value) {
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 140,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
    )
    ;
  }
}

// import 'package:flutter/material.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
//
// String? selectedValue;
//
// class DropdownBtn extends StatelessWidget {
//
//   final List<String> items;
//   final String selectedItemText;
//   final Function(String) onSelected;
//
//   const DropdownBtn({super.key, required this.items, required this.selectedItemText, required this.onSelected});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Center(
//         child: DropdownButton2<String>(
//           isExpanded: true,
//           hint: Text(
//             selectedItemText,
//             style: TextStyle(
//               fontSize: 14,
//               color: Theme.of(context).hintColor,
//             ),
//           ),
//           items: ['item1', 'item2', 'item3']
//               .map((String item) => DropdownMenuItem<String>(
//             value: item,
//             child: Text(
//               item,
//               style: const TextStyle(
//                 fontSize: 14,
//               ),
//             ),
//           ))
//               .toList(),
//           value: selectedValue,
//           onChanged: (String? value) {
//             onSelected(value!);
//           },
//           buttonStyleData: const ButtonStyleData(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             height: 40,
//             width: 140,
//           ),
//           menuItemStyleData: const MenuItemStyleData(
//             height: 40,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
