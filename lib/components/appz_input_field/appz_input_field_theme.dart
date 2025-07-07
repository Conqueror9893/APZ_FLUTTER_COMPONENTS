// Defines enums for controlling the appearance, state, and behavior of AppzInputField.

/// Defines the overall visual style of the input field.
/// This could influence colors, border styles, etc., beyond basic states.
enum AppzInputFieldAppearance {
  /// Standard primary appearance.
  primary,
  /// Alternative secondary appearance (e.g., for less emphasized fields).
  secondary,
  /// Appearance for fields on a dark background or in a filled style.
  filled,
}

/// Defines the current interactive or validation state of the input field.
enum AppzInputFieldState {
  /// Default, interactive state.
  defaultState,
  /// Field has an error (e.g., validation failed).
  error,
  /// Field is not interactive.
  disabled,
  /// Field currently has input focus.
  focused,
  /// Field has been successfully validated (optional visual feedback).
  success,
}

/// Determines the positioning of the label relative to the input field.
enum AppzInputLabelPosition {
  /// Label is displayed above the input field.
  top,
  /// Label is displayed to the left of the input field.
  left,
}

/// Specifies the type of validation to be applied to the input field.
enum AppzInputValidationType {
  /// No specific validation applied beyond what `TextInputType` might enforce.
  none,
  /// Field must not be empty.
  mandatory,
  /// Field must contain a valid email address.
  email,
  /// Field must contain only numeric characters.
  numeric,
  /// Field must represent a monetary amount (e.g., digits, optional decimal point).
  amount,
  /// Field must be a valid password (e.g. length, special characters - specific rules TBD)
  password,
  // Add other specific validation types as needed, e.g., phone, pincode
}

/// Defines the type of input expected, influencing keyboard type and basic formatting.
enum AppzInputType {
  /// Standard text input.
  text,
  /// Multi-line text input.
  multiline,
  /// Numeric input (influences keyboard).
  number,
  /// Phone number input (influences keyboard).
  phone,
  /// Email address input (influences keyboard).
  emailAddress,
  /// URL input (influences keyboard).
  url,
  /// Password input (obscures text).
  password,
  /// Date input.
  date,
  /// Time input.
  dateTime,
  // Add other specific input types as needed
}
