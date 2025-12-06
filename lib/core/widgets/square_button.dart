import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SquareButton extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback? onTap;
  final Color selectedColor;
  final Color unselectedColor;
  final double borderRadius;

  const SquareButton({
    super.key,
    required this.icon,
    required this.isSelected,
    this.onTap,
    this.selectedColor = Colors.black,
    this.unselectedColor = Colors.grey,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isSelected ? 1.0 : 0.6,
      duration: const Duration(milliseconds: 250),
      child: AnimatedContainer(
        width: 40.w,
        height: 40.w,
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: isSelected ? selectedColor : Colors.transparent,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: selectedColor.withOpacity(0.15),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
          ],
        ),
        child: IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            color: isSelected ? selectedColor : unselectedColor,
          ),
        ),
      ),
    );
  }
}
