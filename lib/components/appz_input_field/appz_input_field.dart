import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'appz_input_field_enums.dart';
import 'appz_style_config.dart';
// No longer need direct AadhaarInputFormatter here as sub-widget handles its segments
// import 'formatters/aadhaar_input_formatter.dart';
import 'field_types/aadhaar_input_widget.dart';
import 'field_types/mpin_input_widget.dart';
import 'field_types/mobile_input_widget.dart';

class AppzInputField extends StatefulWidget {
  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final AppzFieldType fieldType;
  final AppzFieldState initialFieldState;
  final String? initialValue;
  final AppzInputValidationType validationType;

  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;

  final bool obscureText;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final int mpinLength;
  final String mobileCountryCode;
  final bool mobileCountryCodeEditable;

  const AppzInputField({
    super.key,
    required this.label,
    this.hintText,
    this.controller,
    this.fieldType = AppzFieldType.defaultType,
    this.initialFieldState = AppzFieldState.defaultState,
    this.initialValue,
    this.validationType = AppzInputValidationType.none,
    this.focusNode,
    this.onChanged,
    this.onTap,
    this.onSubmitted,
    this.validator,
    this.obscureText = false,
    this.textInputAction,
    this.maxLength,
    this.mpinLength = 4,
    this.mobileCountryCode = "+91",
    this.mobileCountryCodeEditable = false,
  });

  @override
  State<AppzInputField> createState() => _AppzInputFieldState();
}

class _AppzInputFieldState extends State<AppzInputField> {
  late TextEditingController _internalController;
  late FocusNode _internalFocusNode;
  AppzFieldState _currentFieldState = AppzFieldState.defaultState;
  String? _validationErrorMessage;

  late List<TextEditingController> _mpinSegmentControllers;
  late List<FocusNode> _mpinSegmentFocusNodes;

  bool get _isEffectivelyDisabled => _currentFieldState == AppzFieldState.disabled;
  bool get _hasError => _currentFieldState == AppzFieldState.error;
  bool get _isFocused => _currentFieldState == AppzFieldState.focused;
  bool get _isFilled => _currentFieldState == AppzFieldState.filled || _internalController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _internalController = widget.controller ?? TextEditingController(text: widget.initialValue);
    _internalFocusNode = widget.focusNode ?? FocusNode();
    _currentFieldState = widget.initialFieldState;

    _internalFocusNode.addListener(_handleFocusChange);
    _internalController.addListener(_handleTextChange);

    _updateFilledState();
    if (widget.initialFieldState == AppzFieldState.disabled) {
      _currentFieldState = AppzFieldState.disabled;
    }
    _initializeMpinFields();
  }

  void _initializeMpinFields() {
    if (widget.fieldType == AppzFieldType.mpin) {
      _mpinSegmentControllers = List.generate(widget.mpinLength, (index) => TextEditingController());
      _mpinSegmentFocusNodes = List.generate(widget.mpinLength, (index) => FocusNode());
      for (int i = 0; i < widget.mpinLength; i++) {
        _mpinSegmentControllers[i].addListener(() => _onMpinSegmentChanged(i));
      }
    } else {
      _mpinSegmentControllers = [];
      _mpinSegmentFocusNodes = [];
    }
  }

  void _disposeMpinFields() {
    if (_mpinSegmentControllers.isNotEmpty) {
      for (var controller in _mpinSegmentControllers) controller.dispose();
      for (var focusNode in _mpinSegmentFocusNodes) focusNode.dispose();
    }
  }

  void _onMpinSegmentChanged(int segmentIndex) {
    final mpinValue = _mpinSegmentControllers.map((c) => c.text).join();
    if (_internalController.text != mpinValue) {
      _internalController.text = mpinValue;
    }
    // Forward focus logic is now primarily in MpinInputWidget's segment onChanged
  }

  @override
  void didUpdateWidget(covariant AppzInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _internalController.removeListener(_handleTextChange);
      _internalController = widget.controller ?? TextEditingController(text: widget.initialValue ?? _internalController.text);
      _internalController.addListener(_handleTextChange);
    }
    if (widget.focusNode != oldWidget.focusNode) {
      _internalFocusNode.removeListener(_handleFocusChange);
      _internalFocusNode = widget.focusNode ?? FocusNode();
      _internalFocusNode.addListener(_handleFocusChange);
    }
    if (widget.initialFieldState != oldWidget.initialFieldState && widget.initialFieldState != _currentFieldState) {
      if (widget.initialFieldState == AppzFieldState.disabled || widget.initialFieldState == AppzFieldState.error) {
        _updateState(widget.initialFieldState);
      }
    }
    if (widget.initialValue != oldWidget.initialValue && widget.controller == null) {
      _internalController.text = widget.initialValue ?? '';
    }
    if (widget.fieldType == AppzFieldType.mpin &&
        (oldWidget.fieldType != AppzFieldType.mpin || widget.mpinLength != oldWidget.mpinLength)) {
      _disposeMpinFields();
      _initializeMpinFields();
    } else if (widget.fieldType != AppzFieldType.mpin && oldWidget.fieldType == AppzFieldType.mpin) {
      _disposeMpinFields();
      _mpinSegmentControllers = [];
      _mpinSegmentFocusNodes = [];
    }
  }

  void _handleFocusChange() {
    if (_isEffectivelyDisabled) return;
    if (_internalFocusNode.hasFocus) {
      _updateState(AppzFieldState.focused);
    } else {
      if (!_hasError) {
        _updateState(_internalController.text.isNotEmpty ? AppzFieldState.filled : AppzFieldState.defaultState);
      }
    }
  }

  void _handleTextChange() {
    if (_isEffectivelyDisabled) return;
    widget.onChanged?.call(_internalController.text);
    _updateFilledState();
    // Trigger validation on text change if autoValidateMode is onUserInteraction (handled by TextFormField)
    // but for custom sub-widgets, we might need to trigger it explicitly if they don't have their own FormField context
    if (widget.fieldType != AppzFieldType.defaultType) { // DefaultType has TextFormField which handles this
        _performValidation(_internalController.text);
    }
  }

  void _updateFilledState() {
    if (_isEffectivelyDisabled || _isFocused || _hasError) {
      if (!_isFocused && !_hasError && _internalController.text.isEmpty && _currentFieldState == AppzFieldState.filled) {
        _updateState(AppzFieldState.defaultState);
      }
      return;
    }
    final bool hasText = _internalController.text.isNotEmpty;
    if (hasText && _currentFieldState != AppzFieldState.filled) {
      _updateState(AppzFieldState.filled);
    } else if (!hasText && _currentFieldState == AppzFieldState.filled) {
      _updateState(AppzFieldState.defaultState);
    }
  }

  void _updateState(AppzFieldState newState, {String? errorMessage}) {
    if (_currentFieldState != newState || _validationErrorMessage != errorMessage) {
      if (mounted) {
        setState(() {
          _currentFieldState = newState;
          _validationErrorMessage = (newState == AppzFieldState.error) ? errorMessage : null;
        });
      }
    }
  }

  String? _performValidation(String? value) {
    _validationErrorMessage = null;
    String? valueToPassToExternalValidator = value;
    String? valueForBuiltInFinalChecks = value;

    // 1. Prepare value for external validator and built-in checks if it's mobile type
    if (widget.fieldType == AppzFieldType.mobile) {
      String numberPart = "";
      if (value != null && value.startsWith("+")) {
        bool foundPrefix = false;
        for (var country in CountryCodesHelper.getCountries()) {
          if (value.startsWith(country.displayDialCode)) {
            numberPart = value.substring(country.displayDialCode.length);
            foundPrefix = true;
            break;
          }
        }
        // If no known prefix is found but starts with "+", it's ambiguous for length check.
        // User's validator gets the part after '+', or full value if parsing is too complex here.
        // For simplicity, if no known prefix, let numberPart be what's after '+' or original value.
        if (!foundPrefix) numberPart = value.startsWith("+") ? value.substring(1) : value;
      } else if (value != null) { // No "+" prefix
        numberPart = value;
      }
      valueToPassToExternalValidator = numberPart;
      valueForBuiltInFinalChecks = numberPart;
    }
    // For default, aadhaar, mpin, the 'value' from _internalController is used directly
    // as their 'widget.validator' (the composed one) expects the full string.

    // 2. Call the effective validator
    //    (User-provided for defaultType; user-provided for mobile (gets number part);
    //     composed validator for aadhaar & mpin (gets full value))
    if (widget.validator != null) {
      _validationErrorMessage = widget.validator!(valueToPassToExternalValidator);
    }

    // 3. If no error from the effective validator (or if it was null),
    //    apply remaining built-in AppzInputValidationType checks.
    if (_validationErrorMessage == null) {
      final String currentValForBuiltIn = valueForBuiltInFinalChecks ?? "";

      // Generic Mandatory Check (applies if not caught by a more specific composed validator or user's validator)
      if (widget.validationType == AppzInputValidationType.mandatory && currentValForBuiltIn.isEmpty) {
        _validationErrorMessage = 'This field is required.'; // TODO: Localize
      }

      // FieldType-specific built-in checks (primarily for defaultType and a fallback for mobile length)
      // These run only if mandatory check passed (or wasn't set) and no prior error.
      if (_validationErrorMessage == null) {
        switch (widget.fieldType) {
          case AppzFieldType.defaultType:
            if (widget.validationType == AppzInputValidationType.email && currentValForBuiltIn.isNotEmpty) {
              final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
              if (!emailRegex.hasMatch(currentValForBuiltIn)) {
                _validationErrorMessage = 'Enter a valid email address.'; // TODO: Localize
              }
            } else if (widget.validationType == AppzInputValidationType.numeric && currentValForBuiltIn.isNotEmpty) {
              if (double.tryParse(currentValForBuiltIn) == null) {
                _validationErrorMessage = 'Enter a valid number.'; // TODO: Localize
              }
            }
            // TODO: Add AppzInputValidationType.amount, .password for defaultType if needed
            break;
          case AppzFieldType.mobile:
            // This length check is a fallback/standard check for the number part.
            // The composed validator in AppzInputField's build method for mobile also does this,
            // but this ensures it if user provided their own validator that didn't check length.
            if (currentValForBuiltIn.isNotEmpty && currentValForBuiltIn.length != 10) {
              _validationErrorMessage = 'Mobile number must be 10 digits.'; // TODO: Localize
            }
            break;
          // For Aadhaar and MPIN, their specific format/length validations are primarily handled
          // by the composed 'validator' functions defined in AppzInputField's build method when
          // their respective sub-widgets are instantiated. Those composed validators already include
          // mandatory and length checks. So, no further specific built-in checks are strictly needed here
          // for Aadhaar/MPIN length/format if those composed validators are comprehensive.
          case AppzFieldType.aadhaar:
          case AppzFieldType.mpin:
          default: // Covers fileUpload, textDescription and any other future types
            break;
        }
      }
    }

    // Update state
    if (_validationErrorMessage != null) {
      _updateState(AppzFieldState.error, errorMessage: _validationErrorMessage);
    } else if (!_isFocused) {
      _updateState(_internalController.text.isNotEmpty ? AppzFieldState.filled : AppzFieldState.defaultState);
    } else if (_isFocused) {
      _updateState(AppzFieldState.focused);
    }
    return _validationErrorMessage;
  }

  @override
  void dispose() {
    _internalFocusNode.removeListener(_handleFocusChange);
    _internalController.removeListener(_handleTextChange);
    if (widget.controller == null) _internalController.dispose();
    if (widget.focusNode == null) _internalFocusNode.dispose();
    _disposeMpinFields();
    super.dispose();
  }

  InputDecoration _createBaseInputDecoration(AppzStateStyle style) {
    return InputDecoration(
      hintText: widget.hintText,
      hintStyle: TextStyle(color: style.textColor.withOpacity(0.5), fontFamily: style.fontFamily, fontSize: style.fontSize),
      filled: true,
      fillColor: style.backgroundColor,
      contentPadding: EdgeInsets.symmetric(horizontal: style.paddingHorizontal, vertical: style.paddingVertical),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(style.borderRadius), borderSide: BorderSide(color: style.borderColor, width: style.borderWidth)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(style.borderRadius), borderSide: BorderSide(color: style.borderColor, width: style.borderWidth)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(style.borderRadius), borderSide: BorderSide(color: AppzStyleConfig.instance.getStyleForState(AppzFieldState.focused, isFilled: _isFilled).borderColor, width: AppzStyleConfig.instance.getStyleForState(AppzFieldState.focused, isFilled: _isFilled).borderWidth)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(style.borderRadius), borderSide: BorderSide(color: AppzStyleConfig.instance.getStyleForState(AppzFieldState.error, isFilled: _isFilled).borderColor, width: AppzStyleConfig.instance.getStyleForState(AppzFieldState.error, isFilled: _isFilled).borderWidth)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(style.borderRadius), borderSide: BorderSide(color: AppzStyleConfig.instance.getStyleForState(AppzFieldState.error, isFilled: _isFilled).borderColor, width: AppzStyleConfig.instance.getStyleForState(AppzFieldState.error, isFilled: _isFilled).borderWidth + 0.5)),
      disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(style.borderRadius), borderSide: BorderSide(color: AppzStyleConfig.instance.getStyleForState(AppzFieldState.disabled, isFilled: _isFilled).borderColor, width: AppzStyleConfig.instance.getStyleForState(AppzFieldState.disabled, isFilled: _isFilled).borderWidth)),
    );
  }

  // THIS IS THE CORRECTED BUILD METHOD
  @override
  Widget build(BuildContext context) {
    if (!AppzStyleConfig.instance.isInitialized) {
      return const Center(child: Text("Styles loading or failed..."));
    }

    // print("DEBUG AppzInputField build: currentFieldState = $_currentFieldState, isEffectivelyDisabled = $_isEffectivelyDisabled, initialFieldState = ${widget.initialFieldState}, isFocused = $_isFocused, hasError = $_hasError, isFilled = $_isFilled, controllerText = '${_internalController.text}'");

    AppzFieldState stateForDeterminingStyle = _currentFieldState;
    // Prioritize error and disabled states for styling if they are active
    if (_isEffectivelyDisabled) {
        stateForDeterminingStyle = AppzFieldState.disabled;
    } else if (_hasError) { // _hasError checks _currentFieldState == AppzFieldState.error
        stateForDeterminingStyle = AppzFieldState.error;
    } else if (_isFocused) {
        stateForDeterminingStyle = AppzFieldState.focused;
    }
    // 'filled' state styling is handled by passing `isFilled: _isFilled` to getStyleForState

    final AppzStateStyle style = AppzStyleConfig.instance.getStyleForState(stateForDeterminingStyle, isFilled: _isFilled);
    final InputDecoration baseFieldDecoration = _createBaseInputDecoration(style); // Used by defaultType

    Widget fieldWidget; // This must be assigned in all paths

    switch (widget.fieldType) {
      case AppzFieldType.defaultType:
        fieldWidget = TextFormField(
          controller: _internalController,
          focusNode: _internalFocusNode,
          decoration: baseFieldDecoration, // No specific overrides needed for defaultType
          style: TextStyle(color: style.textColor, fontFamily: style.fontFamily, fontSize: style.fontSize),
          validator: _performValidation,
          onTap: widget.onTap,
          onFieldSubmitted: widget.onSubmitted,
          obscureText: widget.obscureText,
          textInputAction: widget.textInputAction,
          maxLength: widget.maxLength,
          enabled: !_isEffectivelyDisabled,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        );
        break;
      case AppzFieldType.mobile:
        fieldWidget = MobileInputWidget(
          key: widget.key ?? ValueKey('mobile_${widget.label}'), // Stabilized key
          currentStyle: style,
          mainController: _internalController,
          mainFocusNode: _internalFocusNode,
          isEnabled: !_isEffectivelyDisabled,
          hintText: widget.hintText,
          countryCode: widget.mobileCountryCode,
          countryCodeEditable: widget.mobileCountryCodeEditable,
          // onChanged is handled by _internalController listener in parent
          validator: widget.validator, // User's validator expects 10-digit number part
          validationType: widget.validationType,
        );
        break;
      case AppzFieldType.aadhaar:
        fieldWidget = AadhaarInputWidget(
          key: widget.key ?? ValueKey('aadhaar_${widget.label}'), // Stabilized key
          currentStyle: style,
          mainController: _internalController,
          mainFocusNode: _internalFocusNode,
          isEnabled: !_isEffectivelyDisabled,
          hintText: widget.hintText,
          // onChanged handled by _internalController listener
          validator: widget.validator, // User's validator, or composed one expects full 12 digits
          validationType: widget.validationType,
        );
        break;
      case AppzFieldType.mpin:
        fieldWidget = MpinInputWidget(
          key: widget.key ?? ValueKey('mpin_${widget.label}'), // Stabilized key
          currentStyle: style,
          mainController: _internalController,
        mainFocusNode: _internalFocusNode, // Pass the main focus node
          isEnabled: !_isEffectivelyDisabled,
          obscureText: widget.obscureText,
          mpinLength: widget.mpinLength,
          // onChanged handled by _internalController listener
          validator: widget.validator, // User's validator, or composed one expects full mpin
          validationType: widget.validationType,
        );
        break;
      case AppzFieldType.fileUpload:
      case AppzFieldType.textDescription:
        fieldWidget = Text('Field type ${widget.fieldType.name} not yet fully implemented.');
        break;
      // No default needed as all enum values are handled.
    }

    final String labelTextWithIndicator = (widget.validationType == AppzInputValidationType.mandatory && widget.label.isNotEmpty)
        ? '${widget.label}*'
        : widget.label;
    final Text labelWidget = Text(
      labelTextWithIndicator,
      style: TextStyle(color: style.labelColor, fontFamily: style.fontFamily, fontSize: style.labelFontSize),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label.isNotEmpty) ...[
          labelWidget,
          const SizedBox(height: 6.0),
        ],
        fieldWidget, // Removed the outer Focus widget wrapper
        if (_hasError && _validationErrorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(
              _validationErrorMessage!,
              style: TextStyle(
                  color: AppzStyleConfig.instance.getStyleForState(AppzFieldState.error, isFilled: _isFilled).textColor,
                  fontSize: style.labelFontSize * 0.9,
                  fontFamily: style.fontFamily),
            ),
          ),
      ],
    );
  }
}
