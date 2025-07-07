import 'package:apz_flutter_components/components/appz_input_field/appz_input_field_enums.dart';
import 'package:apz_flutter_components/components/appz_input_field/appz_style_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phonecodes/phonecodes.dart';
import '../appz_input_field_theme.dart';

class MobileInputWidget extends StatefulWidget {
  final TextEditingController mainController;
  final FocusNode mainFocusNode;
  final bool isEnabled;
  final String? hintText;
  final String countryCode;
  final bool countryCodeEditable;
  final AppzStateStyle currentStyle;
  final FormFieldValidator<String>? validator;
  final AppzInputValidationType validationType;

  const MobileInputWidget({
    super.key,
    required this.mainController,
    required this.mainFocusNode,
    required this.isEnabled,
    required this.hintText,
    required this.countryCode,
    required this.countryCodeEditable,
    required this.currentStyle,
    required this.validator,
    required this.validationType,
  });

  @override
  State<MobileInputWidget> createState() => _MobileInputWidgetState();
}

class _MobileInputWidgetState extends State<MobileInputWidget> {
  late TextEditingController _numberController;
  late Country selectedCountry;
  final LayerLink _dropdownLink = LayerLink();
  final GlobalKey _dropdownKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  String? _errorText;

  @override
  void initState() {
    super.initState();
    _numberController = TextEditingController();
    selectedCountry = Country.values.firstWhere(
      (c) => c.dialCode == widget.countryCode,
      orElse: () => Country.india,
    );
    _numberController.addListener(_updateCombinedValue);
  }

  void _updateCombinedValue() {
    widget.mainController.text =
        '${selectedCountry.dialCode} ${_numberController.text}';
    _validate(_numberController.text);
  }

  void _validate(String? val) {
    final digitsOnly = val?.replaceAll(RegExp(r'\D'), '') ?? '';
    String? error;

    if (widget.validationType == AppzInputValidationType.mandatory &&
        digitsOnly.isEmpty) {
      error = 'This field is required.';
    } else if (!RegExp(r'^\d{10}$').hasMatch(digitsOnly)) {
      error = 'Mobile number must be 10 digits.';
    }

    if (error == null && widget.validator != null) {
      error = widget.validator!(digitsOnly);
    }

    if (_errorText != error) {
      setState(() => _errorText = error);
    }
  }

  void _showDropdown() {
    _hideDropdown();
    _overlayEntry = _buildDropdownOverlay();
    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
  }

  void _hideDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _buildDropdownOverlay() {
    final RenderBox box =
        _dropdownKey.currentContext!.findRenderObject() as RenderBox;
    final double width = box.size.width;

    return OverlayEntry(
      builder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: _hideDropdown,
          child: Stack(
            children: [
              CompositedTransformFollower(
                link: _dropdownLink,
                showWhenUnlinked: false,
                offset: Offset(0, box.size.height + 6),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(8),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 250, maxWidth: width),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: Country.values.length,
                      itemBuilder: (_, index) {
                        final country = Country.values[index];
                        return ListTile(
                          leading: Text('${country.flag} ${country.dialCode}'),
                          onTap: () {
                            setState(() => selectedCountry = country);
                            _updateCombinedValue();
                            _hideDropdown();
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _numberController.removeListener(_updateCombinedValue);
    _numberController.dispose();
    _hideDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.currentStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CompositedTransformTarget(
              link: _dropdownLink,
              child: GestureDetector(
                key: _dropdownKey,
                onTap: widget.countryCodeEditable && widget.isEnabled
                    ? _showDropdown
                    : null,
                child: Container(
                  constraints: const BoxConstraints(minWidth: 100, maxWidth: 120),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  decoration: BoxDecoration(
                    color: style.backgroundColor,
                    borderRadius: BorderRadius.circular(style.borderRadius),
                    border: Border.all(
                        color: style.borderColor, width: style.borderWidth),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${selectedCountry.flag} ${selectedCountry.dialCode}',
                          style: TextStyle(
                            fontSize: style.fontSize,
                            color: style.textColor,
                            fontFamily: style.fontFamily,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.arrow_drop_down, size: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: style.backgroundColor,
                  borderRadius: BorderRadius.circular(style.borderRadius),
                  border: Border.all(
                      color: style.borderColor, width: style.borderWidth),
                ),
                child: TextField(
                  controller: _numberController,
                  focusNode: widget.mainFocusNode,
                  enabled: widget.isEnabled,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.hintText ?? 'Enter number',
                    hintStyle: TextStyle(
                      color: style.textColor.withOpacity(0.5),
                      fontSize: style.fontSize,
                      fontFamily: style.fontFamily,
                    ),
                  ),
                  style: TextStyle(
                    color: style.textColor,
                    fontSize: style.fontSize,
                    fontFamily: style.fontFamily,
                  ),
                ),
              ),
            ),
          ],
        ),
        if (_errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(
              _errorText!,
              style: TextStyle(
                color: AppzStyleConfig.instance
                    .getStyleForState(AppzFieldState.error)
                    .textColor,
                fontSize: style.labelFontSize * 0.9,
                fontFamily: style.fontFamily,
              ),
            ),
          ),
      ],
    );
  }
}
/*import 'package:apz_flutter_components/components/appz_input_field/appz_style_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phonecodes/phonecodes.dart';
import '../appz_input_field_theme.dart';

class MobileInputWidget extends StatefulWidget {
  final TextEditingController mainController;
  final FocusNode mainFocusNode;
  final bool isEnabled;
  final String? hintText;
  final String countryCode;
  final bool countryCodeEditable;
  final AppzStateStyle currentStyle;
  final FormFieldValidator<String>? validator;
  final AppzInputValidationType validationType;

  const MobileInputWidget({
    super.key,
    required this.mainController,
    required this.mainFocusNode,
    required this.isEnabled,
    required this.hintText,
    required this.countryCode,
    required this.countryCodeEditable,
    required this.currentStyle,
    required this.validator,
    required this.validationType,
  });

  @override
  State<MobileInputWidget> createState() => _MobileInputWidgetState();
}

class _MobileInputWidgetState extends State<MobileInputWidget> {
  late TextEditingController _numberController;
  late Country selectedCountry;
  final LayerLink _dropdownLink = LayerLink();
  final GlobalKey _dropdownKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _numberController = TextEditingController();
    selectedCountry = Country.values.firstWhere(
      (c) => c.dialCode == widget.countryCode,
      orElse: () => Country.india,
    );
    _numberController.addListener(_updateCombinedValue);
  }

  void _updateCombinedValue() {
    widget.mainController.text = '${selectedCountry.dialCode} ${_numberController.text}';
  }

  void _showDropdown() {
    _hideDropdown();
    _overlayEntry = _buildDropdownOverlay();
    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
  }

  void _hideDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _buildDropdownOverlay() {
    final RenderBox box = _dropdownKey.currentContext!.findRenderObject() as RenderBox;
    final double width = box.size.width;

    return OverlayEntry(
      builder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: _hideDropdown,
          child: Stack(
            children: [
              CompositedTransformFollower(
                link: _dropdownLink,
                showWhenUnlinked: false,
                offset: Offset(0, box.size.height + 6),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(8),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 250,
                      maxWidth: width,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: Country.values.length,
                      itemBuilder: (_, index) {
                        final country = Country.values[index];
                        return ListTile(
                          leading: Text('${country.flag} ${country.dialCode}'),
                          //title: Text('${country.name} (${country.dialCode})'),
                          onTap: () {
                            setState(() => selectedCountry = country);
                            _updateCombinedValue();
                            _hideDropdown();
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _numberController.removeListener(_updateCombinedValue);
    _numberController.dispose();
    _hideDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.currentStyle;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CompositedTransformTarget(
          link: _dropdownLink,
          child: GestureDetector(
            key: _dropdownKey,
            onTap: widget.countryCodeEditable && widget.isEnabled ? _showDropdown : null,
            child: Container(
              constraints: const BoxConstraints(minWidth: 100, maxWidth: 120),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              decoration: BoxDecoration(
                color: style.backgroundColor,
                borderRadius: BorderRadius.circular(style.borderRadius),
                border: Border.all(color: style.borderColor, width: style.borderWidth),
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${selectedCountry.flag} ${selectedCountry.dialCode}',
                      style: TextStyle(
                        fontSize: style.fontSize,
                        color: style.textColor,
                        fontFamily: style.fontFamily,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.arrow_drop_down, size: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: style.backgroundColor,
              borderRadius: BorderRadius.circular(style.borderRadius),
              border: Border.all(color: style.borderColor, width: style.borderWidth),
            ),
            child: TextFormField(
              controller: _numberController,
              focusNode: widget.mainFocusNode,
              enabled: widget.isEnabled,
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText ?? 'Enter number',
                hintStyle: TextStyle(
                  color: style.textColor.withOpacity(0.5),
                  fontSize: style.fontSize,
                  fontFamily: style.fontFamily,
                ),
              ),
              style: TextStyle(
                color: style.textColor,
                fontSize: style.fontSize,
                fontFamily: style.fontFamily,
              ),
              //validator: (_) => null,
              validator: (val) {
                final digitsOnly = val?.replaceAll(RegExp(r'\D'), '') ?? '';
                
                if (widget.validationType == AppzInputValidationType.mandatory && digitsOnly.isEmpty) {
                  return 'This field is required.';
                }
                if (!RegExp(r'^\d{10}$').hasMatch(digitsOnly)) {
                  return 'Mobile number must be 10 digits.';
                }
                if (widget.validator != null) {
                  return widget.validator!(digitsOnly);
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
        ),
      ],
    );
  }
}*/