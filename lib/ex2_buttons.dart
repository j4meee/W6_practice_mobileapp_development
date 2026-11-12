import 'package:flutter/material.dart';

// EX 2 – The buttons (handout page: EX 2)
// A StatelessWidget called CustomButton. Use one enum for the button type
// and one enum for the icon position.

enum ButtonType {
  primary,
  secondary,
  disabled
}

enum IconPosition {
  left,
  right
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType type;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.type = ButtonType.primary
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor;

    if (type == ButtonType.primary) {
      buttonColor = Colors.blue;
    } else if (type == ButtonType.secondary) {
      buttonColor = Colors.green;
    } else {
      buttonColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 18
      ),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(30) 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPosition == IconPosition.left) ...[
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12)
          ],
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          if (iconPosition == IconPosition.right) ...[
            const SizedBox(width: 12),
            Icon(icon, color: Colors.white,)
          ],
        ],
      )
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom buttons'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomButton(
                label: 'Submit', 
                icon: Icons.check
              ),
              SizedBox(height: 10,),
              CustomButton(
                label: 'Time', 
                icon: Icons.timer,
                type: ButtonType.secondary,
                iconPosition: IconPosition.right,
              ),
              SizedBox(height: 10,),
              CustomButton(
                label: 'Account', 
                icon: Icons.account_tree_sharp,
                type: ButtonType.disabled,
                iconPosition: IconPosition.right,
              )
            ],
          ),
        ) // YOUR CODE
      ),
    ),
  );
}
