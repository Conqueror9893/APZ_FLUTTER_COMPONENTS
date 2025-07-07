// Defines enums for controlling the AppzInputField component.

/// Defines the visual and interactive state of the AppzInputField.
enum AppzFieldState {
  /// Standard, default interactive state.
  defaultState,

  /// Indicates the field has content. Visual distinction may vary based on UI config.
  filled,

  /// Indicates the field currently has input focus.
  focused,

  /// Indicates the field is not interactive.
  disabled,

  /// Indicates the field has a validation error.
  error,
}

/// Defines the specific type or variant of the AppzInputField.
/// This determines its structure, behavior, and specific styling aspects.
enum AppzFieldType {
  /// A standard single-line text input field.
  defaultType,

  /// A field for entering an MPIN, typically 4-6 digits in separate boxes.
  mpin,

  /// A field for entering an Aadhaar number, typically with XXXX XXXX XXXX formatting.
  aadhaar,

  /// A field for entering a mobile phone number, often with a country code prefix.
  mobile,

  /// A UI element for initiating a file upload.
  fileUpload,

  /// A field for displaying or entering longer text descriptions, potentially read-only or auto-resizing.
  textDescription,
}
