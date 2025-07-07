import 'package:flutter/services.dart';

class AadhaarInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Get the new text and remove any non-digit characters
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // If the new text is longer than 12 digits, truncate it
    if (newText.length > 12) {
      newText = newText.substring(0, 12);
    }

    StringBuffer formattedText = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      formattedText.write(newText[i]);
      if ((i == 3 || i == 7) && i != newText.length - 1) {
        formattedText.write(' '); // Add space after 4th and 8th digit
      }
    }

    // Calculate the new cursor position
    int selectionIndex = formattedText.length;

    // If a space was just added, and the original cursor was at the end of a group,
    // we might need to adjust the cursor to be after the space.
    // This logic can be complex depending on how backspacing near spaces is handled.
    // For simplicity, we'll place it at the end for now.
    // A more sophisticated approach would track cursor movement more closely.

    // ConsidernewValue.selection.end for more precise cursor placement if needed,
    // especially when deleting characters.

    // If the formatted text is "X X X X", cursor is at 1. oldValue "X", newValue "X "
    // oldValue: "1234" newValue: "12345" -> formatted: "1234 5" (selection 6)
    // oldValue: "1234 " newValue: "1234" (deleted space) -> formatted: "1234" (selection 4)

    // This basic cursor adjustment attempts to keep it at the end or where it was
    // relative to the digits.
    int newSelectionOffset = newValue.selection.end;
    int spacesBeforeCursor = 0;
    for(int i=0; i< newValue.selection.end && i < formattedText.length; i++){
        if(formattedText.toString()[i] == ' '){
            spacesBeforeCursor++;
        }
    }
    newSelectionOffset = newValue.selection.end + spacesBeforeCursor - (newValue.text.substring(0, newValue.selection.end).split(' ').length -1);

    // Ensure selection offset is within bounds
    if (newSelectionOffset > formattedText.length) {
      newSelectionOffset = formattedText.length;
    }


    return TextEditingValue(
      text: formattedText.toString(),
      selection: TextSelection.collapsed(offset: newSelectionOffset),
    );
  }
}
