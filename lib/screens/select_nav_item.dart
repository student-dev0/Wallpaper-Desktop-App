import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectNavItem extends StatefulWidget {
  final AssetImage assetImage;
  final String label;
  final ValueChanged<String> onTap;
  final bool isSelected;

  const SelectNavItem({
    super.key,
    required this.isSelected,
    required this.label,
    required this.onTap,
    required this.assetImage,
  });

  @override
  State<SelectNavItem> createState() => _SelectNavItemState();
}

class _SelectNavItemState extends State<SelectNavItem> {
  void _handleOnTap() {
    widget.onTap(widget.label);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleOnTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          border: widget.isSelected
              ? Border.all(color: Colors.grey, width: 1)
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageIcon(widget.assetImage, color: Color(0xFF00001A)),
            SizedBox(width: 10),
            Text(
              widget.label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
