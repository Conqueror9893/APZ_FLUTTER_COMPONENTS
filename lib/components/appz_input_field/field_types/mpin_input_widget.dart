import 'package:apz_flutter_components/components/appz_input_field/appz_input_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../appz_input_field_enums.dart';
import '../appz_style_config.dart';

class MpinInputWidget extends StatefulWidget {
  final AppzStateStyle currentStyle;
  final TextEditingController mainController; // For the combined MPIN
  final bool isEnabled;
  final bool obscureText;
  final int mpinLength;
  final ValueChanged<String>? onChanged; // Called with combined mpin string
  final FormFieldValidator<String>? validator; // Validates combined mpin string
  final AppzInputValidationType validationType;
  final FocusNode? mainFocusNode; // For overall component focus


  const MpinInputWidget({
    super.key,
    required this.currentStyle,
    required this.mainController,
    required this.isEnabled,
    required this.obscureText,
    required this.mpinLength,
    this.mainFocusNode,
    this.onChanged,
    this.validator,
    required this.validationType,
  });

  @override
  State<MpinInputWidget> createState() => _MpinInputWidgetState();
}

class _MpinInputWidgetState extends State<MpinInputWidget> {
  late List<TextEditingController> _segmentControllers;
  late List<FocusNode> _segmentFocusNodes;

  @override
  void initState() {
    super.initState();
    _initializeSegments();
    widget.mainFocusNode?.addListener(_handleMainFocus);
  }

  void _handleMainFocus() {
    if (widget.mainFocusNode != null && widget.mainFocusNode!.hasFocus && widget.isEnabled) {
      // Focus the first empty or first segment
      for (int i = 0; i < widget.mpinLength; i++) {
        if (_segmentControllers[i].text.isEmpty) {
          FocusScope.of(context).requestFocus(_segmentFocusNodes[i]);
          return;
        }
      }
      if (_segmentFocusNodes.isNotEmpty) {
         FocusScope.of(context).requestFocus(_segmentFocusNodes[0]);
      }
    }
  }

  void _initializeSegments() {
    _segmentControllers = List.generate(
      widget.mpinLength,
      (index) => TextEditingController(),
    );
    _segmentFocusNodes = List.generate(
      widget.mpinLength,
      (index) => FocusNode(),
    );

    for (int i = 0; i < widget.mpinLength; i++) {
      _segmentControllers[i].addListener(() => _onSegmentChanged(i));
      // TODO: Add RawKeyboardListener or similar for better backspace handling if needed
    }
  }

  void _disposeSegments() {
    for (var controller in _segmentControllers) {
      controller.dispose();
    }
    for (var focusNode in _segmentFocusNodes) {
      focusNode.dispose();
    }
  }

  @override
  void didUpdateWidget(covariant MpinInputWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.mpinLength != oldWidget.mpinLength) {
      _disposeSegments();
      _initializeSegments(); // This already re-adds listeners to new segment controllers
    }
    if (widget.mainFocusNode != oldWidget.mainFocusNode) {
       oldWidget.mainFocusNode?.removeListener(_handleMainFocus);
       widget.mainFocusNode?.addListener(_handleMainFocus);
    }
    // If isEnabled changes, parent rebuild will pass new isEnabled, affecting segment TextFormFields.
  }


  void _onSegmentChanged(int segmentIndex) {
    final currentValue = _segmentControllers[segmentIndex].text;

    // Update main controller
    String combinedValue = _segmentControllers.map((c) => c.text).join();
    if (widget.mainController.text != combinedValue) {
      widget.mainController.text = combinedValue;
      widget.onChanged?.call(combinedValue);
    }

    if (!widget.isEnabled) return;

    // Auto-focus next field
    if (currentValue.isNotEmpty && segmentIndex < widget.mpinLength - 1) {
      FocusScope.of(context).requestFocus(_segmentFocusNodes[segmentIndex + 1]);
    }
    // Backspace logic will be enhanced in the build method's TextFormField onChanged

    // If the current segment is now full AND it's not the last segment, move focus forward.
    // This part is already handled by the _onSegmentChanged called from the listener if text becomes non-empty.
    // Redundant here but ensures quick focus on direct typing if listener is too slow.
    // if (currentValue.isNotEmpty && segmentIndex < widget.mpinLength - 1) {
    //   FocusScope.of(context).requestFocus(_segmentFocusNodes[segmentIndex + 1]);
    // }
  }

  @override
  void dispose() {
    widget.mainFocusNode?.removeListener(_handleMainFocus);
    _disposeSegments();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppzStateStyle style = widget.currentStyle; // Use passed style

    // Base InputDecoration for MPIN segments
    // This can be further customized if AppzStyleConfig provides MPIN-specific style keys
    final mpinSegmentBaseDecoration = InputDecoration(
      counterText: "", // Hide the maxLength counter
      contentPadding: EdgeInsets.zero, // Adjust padding for centering
      filled: true,
      fillColor: style.backgroundColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(style.borderRadius / 1.5), // Smaller radius
        borderSide: BorderSide(color: style.borderColor, width: style.borderWidth),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(style.borderRadius / 1.5),
        borderSide: BorderSide(color: style.borderColor, width: style.borderWidth),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(style.borderRadius / 1.5),
        borderSide: BorderSide(
          color: AppzStyleConfig.instance.getStyleForState(AppzFieldState.focused, isFilled: widget.mainController.text.isNotEmpty).borderColor,
          width: AppzStyleConfig.instance.getStyleForState(AppzFieldState.focused, isFilled: widget.mainController.text.isNotEmpty).borderWidth,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(style.borderRadius / 1.5),
        borderSide: BorderSide(
          color: AppzStyleConfig.instance.getStyleForState(AppzFieldState.disabled).borderColor,
          width: AppzStyleConfig.instance.getStyleForState(AppzFieldState.disabled).borderWidth,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(style.borderRadius / 1.5),
        borderSide: BorderSide(
          color: AppzStyleConfig.instance.getStyleForState(AppzFieldState.error).borderColor,
          width: AppzStyleConfig.instance.getStyleForState(AppzFieldState.error).borderWidth,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(style.borderRadius / 1.5),
        borderSide: BorderSide(
          color: AppzStyleConfig.instance.getStyleForState(AppzFieldState.error).borderColor,
          width: AppzStyleConfig.instance.getStyleForState(AppzFieldState.error).borderWidth + 0.5,
        ),
      ),
    );

    /*return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Or .start with SizedBox for spacing
      children: List.generate(widget.mpinLength, (index) {
        return SizedBox(
          width: 48, // TODO: Make configurable via AppzStyleConfig (e.g., style.mpinSegmentWidth)
          height: 52, // TODO: Make configurable via AppzStyleConfig (e.g., style.mpinSegmentHeight)
          child: TextFormField(
            controller: _segmentControllers[index],
            focusNode: _segmentFocusNodes[index],
            enabled: widget.isEnabled,
            textAlign: TextAlign.center,
            maxLength: 1,
            obscureText: widget.obscureText,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: TextStyle(
              color: widget.isEnabled ? style.textColor : style.textColor.withOpacity(0.5),
              fontFamily: style.fontFamily,
              fontSize: style.fontSize + 4, // Larger font for single digit
              fontWeight: FontWeight.bold,
            ),
            decoration: mpinSegmentBaseDecoration,
            onChanged: (value) {
              // Call the listener-based handler first to aggregate value
              // and handle standard forward focus.
              // _onSegmentChanged(index); // Listener on controller already does this.

              if (value.isEmpty) {
                if (index > 0) {
                  // If current field is cleared by backspace, move to previous
                  FocusScope.of(context).requestFocus(_segmentFocusNodes[index - 1]);
                  // Select text in the previous field for easy overwrite/delete
                  _segmentControllers[index - 1].selection = TextSelection(
                    baseOffset: 0,
                    extentOffset: _segmentControllers[index - 1].text.length,
                  );
                }
              } else if (value.isNotEmpty) { // Character was entered
                if (index < widget.mpinLength - 1) {
                  // If char entered and not last field, move to next
                  FocusScope.of(context).requestFocus(_segmentFocusNodes[index + 1]);
                } else {
                  // Last field, character entered, unfocus
                  _segmentFocusNodes[index].unfocus();
                  // Potentially trigger onSubmitted for the main field
                }
              }
              // Ensure the main controller is updated (listener on segment controller should do this)
              // String combinedValue = _segmentControllers.map((c) => c.text).join();
              // if (widget.mainController.text != combinedValue) {
              //   widget.mainController.text = combinedValue;
              // }
            },
          ),
        );
      }),
    );*/
    return Wrap(
      spacing: 12, // Fixed minimal spacing between boxes
      runSpacing: 8, // Optional: vertical spacing if it wraps
      children: List.generate(widget.mpinLength, (index) {
        return SizedBox(
          width: 48,
          height: 52,
          child: TextFormField(
            controller: _segmentControllers[index],
            focusNode: _segmentFocusNodes[index],
            enabled: widget.isEnabled,
            textAlign: TextAlign.center,
            maxLength: 1,
            obscureText: widget.obscureText,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: TextStyle(
              color: widget.isEnabled ? style.textColor : style.textColor.withOpacity(0.5),
              fontFamily: style.fontFamily,
              fontSize: style.fontSize + 4,
              fontWeight: FontWeight.bold,
            ),
            decoration: mpinSegmentBaseDecoration,
            onChanged: (value) {
              if (value.isEmpty && index > 0) {
                FocusScope.of(context).requestFocus(_segmentFocusNodes[index - 1]);
                _segmentControllers[index - 1].selection = TextSelection(
                  baseOffset: 0,
                  extentOffset: _segmentControllers[index - 1].text.length,
                );
              } else if (value.isNotEmpty && index < widget.mpinLength - 1) {
                FocusScope.of(context).requestFocus(_segmentFocusNodes[index + 1]);
              } else if (index == widget.mpinLength - 1) {
                _segmentFocusNodes[index].unfocus();
              }
            },
          ),
        );
      }),
    );
  }
}
