import 'package:csc_picker/csc_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_seller/generated/assets.dart';

import '../constants/colors.dart';
import 'Icons_wit_text.dart';
import 'assetImage_withtext.dart';

class BranchesWidget extends StatefulWidget {
  final Function(List<Branches>) onBranchesChanged;

  BranchesWidget({required this.onBranchesChanged});

  @override
  _BranchesWidgetState createState() => _BranchesWidgetState();
}

class _BranchesWidgetState extends State<BranchesWidget> {
  List<Branches> branches = [];

  @override
  void initState() {
    super.initState();
    // Initialize with one empty Branch
    branches.add(Branches());
  }

  void addBranch() {
    setState(() {
      branches.add(Branches());
      widget.onBranchesChanged(branches);
    });
  }

  void removeBranch() {
    setState(() {
      if (branches.isNotEmpty) {
        branches.removeLast();
        widget.onBranchesChanged(branches);
      }
    });
  }

  Widget buildCSCPicker(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CSCPicker(
        showStates: true,
        showCities: false,
        flagState: CountryFlag.DISABLE,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
          border: Border.all(color: Colors.white, width: 1),
        ),
        disabledDropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.grey.shade300,
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        countrySearchPlaceholder: "الدولة",
        stateSearchPlaceholder: "المدينة",
        citySearchPlaceholder: "City",
        countryDropdownLabel: "الدولة",
        stateDropdownLabel: "المدينة",
        cityDropdownLabel: "City",
        selectedItemStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
        dropdownHeadingStyle: TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
        dropdownItemStyle: TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
        dropdownDialogRadius: 20.0,
        searchBarRadius: 10.0,
        onCountryChanged: (value) {
          setState(() {
            branches[index].country = value;
            widget.onBranchesChanged(branches);
          });
        },
        onStateChanged: (value) {
          setState(() {
            branches[index].state = value;
            widget.onBranchesChanged(branches);
          });
        },
        onCityChanged: (value) {
          // setState(() {
          //   branches[index].city = value;
          //   widget.onBranchesChanged(branches);
          // });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconWithText(
                color: MyColors.primary,
                text: "اضافة فرع".tr(),
                onPressed: addBranch,
                icon: Icons.add_box_rounded,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "الفروع الاخري".tr(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          ...branches.asMap().entries.map((entry) {
            int index = entry.key;
            return buildCSCPicker(index);
          }).toList(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageWithText(
                  color: MyColors.red,
                  text: "حذف الفرع".tr(),
                  onPressed: removeBranch,
                  imagePath: Assets.trashCan,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Branches {
  String? country;
  String? state;

  Branches({this.country, this.state});

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'state': state,
    };
  }

  factory Branches.fromMap(Map<String, dynamic> map) {
    return Branches(
      country: map['country'],
      state: map['state'],
    );
  }
}

// class Branches {
//   List<BranchesList>? branchesList;

//   Branches({this.branchesList});

//   Branches.fromJson(Map<String, dynamic> json) {
//     if (json['branchesList'] != null) {
//       branchesList = <BranchesList>[];
//       json['branchesList'].forEach((v) {
//         branchesList!.add(new BranchesList.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.branchesList != null) {
//       data['branchesList'] = this.branchesList!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class BranchesList {
//   String? city;
//   String? country;
//   String? state;

//   BranchesList({this.city, this.country, this.state});

//   BranchesList.fromJson(Map<String, dynamic> json) {
//     city = json['city'];
//     country = json['country'];
//     state = json['state'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['city'] = this.city;
//     data['country'] = this.country;
//     data['state'] = this.state;
//     return data;
//   }
// }
