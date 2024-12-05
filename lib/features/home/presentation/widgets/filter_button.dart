import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const FilterButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.selected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: Colors.blue),
      label: Row(
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.blue),
          ),
          if (selected)
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(Icons.close, color: Colors.blue, size: 16),
            ),
        ],
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: selected ? Colors.grey[200] : Colors.white,
        side: const BorderSide(color: Colors.blue),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
      ),
    );
  }
}

class Filter {
  IconData icon;
  String label;
  bool selected;

  Filter({required this.icon, required this.label, required this.selected});
}
