import 'package:apz_flutter_components/components/appz_input_field/appz_input_field_enums.dart';
import 'package:apz_flutter_components/components/appz_input_field/appz_input_field_theme.dart';
import 'package:apz_flutter_components/components/appz_input_field/appz_style_config.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ApzUploadFileWidget extends StatefulWidget {
  final AppzStateStyle currentStyle;
  final bool isEnabled;
  final String? labelText;
  final String? hintText;
  final String? allowedExtensionsDescription;
  final List<String> allowedExtensions;
  final ValueChanged<PlatformFile>? onFileSelected;
  final FormFieldValidator<PlatformFile>? validator;
  final AppzInputValidationType validationType;
  final PlatformFile? selectedFile;
  final int maxSizeInKB;

  const ApzUploadFileWidget({
    super.key,
    required this.currentStyle,
    required this.isEnabled,
    this.labelText,
    this.hintText,
    this.allowedExtensionsDescription,
    required this.allowedExtensions,
    this.onFileSelected,
    this.validator,
    required this.validationType,
    this.selectedFile,
    this.maxSizeInKB = 2048, // default 2MB
  });

  @override
  State<ApzUploadFileWidget> createState() => _ApzUploadFileWidgetState();
}

class _ApzUploadFileWidgetState extends State<ApzUploadFileWidget> {
  PlatformFile? _selectedFile;
  String? _errorText;
  bool _touched = false;

  @override
  void initState() {
    super.initState();
    _selectedFile = widget.selectedFile;
  }

  void _pickFile() async {
    setState(() => _touched = true);
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: widget.allowedExtensions,
    );

    if (result != null && result.files.isNotEmpty) {
      PlatformFile file = result.files.first;
      final int sizeInKB = (file.size / 1024).ceil();

      String? error;
      if (sizeInKB > widget.maxSizeInKB) {
        error = 'File exceeds max size of ${widget.maxSizeInKB}KB';
      } else if (widget.validator != null) {
        error = widget.validator!(file);
      }

      setState(() {
        _selectedFile = file;
        _errorText = error;
      });

      if (error == null) {
        widget.onFileSelected?.call(file);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.currentStyle;
    final hasError = _errorText != null && _touched;
    final displayFile = _selectedFile?.name ?? widget.hintText ?? "Click to upload the document";

    final state = !widget.isEnabled
        ? AppzFieldState.disabled
        : hasError
            ? AppzFieldState.error
            : AppzFieldState.defaultState;
    final effectiveStyle = AppzStyleConfig.instance.getStyleForState(state);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0, left: 4.0),
            child: Text(
              widget.labelText!,
              style: TextStyle(
                fontSize: style.labelFontSize,
                fontFamily: style.fontFamily,
                color: style.labelColor,
              ),
            ),
          ),
        GestureDetector(
          onTap: widget.isEnabled ? _pickFile : null,
          child: Container(
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: style.backgroundColor,
              borderRadius: BorderRadius.circular(style.borderRadius),
              border: Border.all(
                color: effectiveStyle.borderColor,
                width: effectiveStyle.borderWidth,
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.cloud_upload_outlined, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayFile,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: style.textColor,
                          fontFamily: style.fontFamily,
                          fontSize: style.fontSize,
                        ),
                      ),
                      if (widget.allowedExtensionsDescription != null)
                        Text(
                          widget.allowedExtensionsDescription!,
                          style: TextStyle(
                            fontSize: style.fontSize * 0.8,
                            color: style.textColor.withOpacity(0.6),
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (hasError && _errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 6.0, left: 4.0),
            child: Text(
              _errorText!,
              style: TextStyle(
                color: AppzStyleConfig.instance.getStyleForState(AppzFieldState.error).textColor,
                fontSize: style.labelFontSize * 0.9,
                fontFamily: style.fontFamily,
              ),
            ),
          )
      ],
    );
  }
}
