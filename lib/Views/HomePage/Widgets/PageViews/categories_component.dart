import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

Widget categoriesComponent() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Explore Categories",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            hintText: 'Mention Category',
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.lightGreen,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            itemCount: categoryData.length,
            itemBuilder: (context, index) {
              return categoryItems(
                iconData: categoryData[index]['icon'],
                label: categoryData[index]['label'],
                bgColor: categoryData[index]['color'],
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget categoryItems({
  required IconData iconData,
  required String label,
  required Color bgColor,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Icon(
          iconData,
          color: Colors.white,
          size: 28,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}

List<Map<String, dynamic>> categoryData = [
  {
    'icon': FontAwesomeIcons.film,
    'label': 'Movies',
    'color': Colors.orange,
  },
  {
    'icon': MdiIcons.school,
    'label': 'Fees',
    'color': Colors.blue,
  },
  {
    'icon': FontAwesomeIcons.moneyBill,
    'label': 'Salary',
    'color': Colors.green
  },
  {
    'icon': FontAwesomeIcons.car,
    'label': 'Car',
    'color': Colors.red,
  },
  {
    'icon': MdiIcons.receipt,
    'label': 'Bills',
    'color': Colors.purple,
  },
  {
    'icon': MdiIcons.shopping,
    'label': 'Shopping',
    'color': Colors.pink,
  },
  {
    'icon': FontAwesomeIcons.piggyBank,
    'label': 'Savings',
    'color': Colors.teal
  },
  {
    'icon': FontAwesomeIcons.utensils,
    'label': 'Food',
    'color': Colors.brown,
  },
  {
    'icon': MdiIcons.hospital,
    'label': 'Medical',
    'color': Colors.cyan,
  },
  {
    'icon': FontAwesomeIcons.book,
    'label': 'Books',
    'color': Colors.lime,
  },
  {
    'icon': MdiIcons.partyPopper,
    'label': 'Events',
    'color': Colors.indigo,
  },
  {
    'icon': FontAwesomeIcons.child,
    'label': 'Kids',
    'color': Colors.deepOrange,
  },
  {
    'icon': FontAwesomeIcons.dumbbell,
    'label': 'Fitness',
    'color': Colors.blueGrey,
  },
  {
    'icon': MdiIcons.beach,
    'label': 'Travel',
    'color': Colors.lightBlueAccent,
  },
  {
    'icon': FontAwesomeIcons.house,
    'label': 'Home',
    'color': Colors.greenAccent,
  },
  {
    'icon': MdiIcons.babyBottle,
    'label': 'Baby Care',
    'color': Colors.deepPurpleAccent,
  },
  {
    'icon': FontAwesomeIcons.gamepad,
    'label': 'Gaming',
    'color': Colors.yellow,
  },
  {
    'icon': MdiIcons.toolbox,
    'label': 'Repairs',
    'color': Colors.blueAccent,
  },
  {
    'icon': MdiIcons.cellphone,
    'label': 'Electronics',
    'color': Colors.grey,
  },
  {
    'icon': FontAwesomeIcons.palette,
    'label': 'Art',
    'color': Colors.redAccent,
  },
  {
    'icon': MdiIcons.account,
    'label': 'Personal',
    'color': Colors.pinkAccent,
  },
  {
    'icon': FontAwesomeIcons.ellipsis,
    'label': 'Others',
    'color': Colors.black54,
  },
];
