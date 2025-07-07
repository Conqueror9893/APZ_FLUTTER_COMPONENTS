import 'package:apz_flutter_components/components/appz_input_field/appz_input_field_theme.dart';
import 'package:flutter/material.dart';
// Adjust path if your project structure is different for the imports below
import '../lib/components/appz_input_field/appz_input_field.dart';
import '../lib/components/appz_input_field/appz_input_field_enums.dart';
// AppzStyleConfig is used internally by AppzInputField, direct import not always needed for usage.

class AppzInputFieldExamplePage extends StatefulWidget {
  const AppzInputFieldExamplePage({super.key});

  @override
  State<AppzInputFieldExamplePage> createState() => _AppzInputFieldExamplePageState();
}

class _AppzInputFieldExamplePageState extends State<AppzInputFieldExamplePage> {
  final _defaultController = TextEditingController();
  final _filledController = TextEditingController(text: "Already Filled");
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _disabledController = TextEditingController(text: "Disabled Text");
  final _errorController = TextEditingController();
  final _mobileController = TextEditingController();
  final _aadhaarController = TextEditingController();
  final _mpinController4digit = TextEditingController();
  final _mpinController6digit = TextEditingController();
  final _mobileWithDropdownController = TextEditingController();


  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _defaultController.dispose();
    _filledController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _disabledController.dispose();
    _errorController.dispose();
    _mobileController.dispose();
    _aadhaarController.dispose();
    _mpinController4digit.dispose();
    _mpinController6digit.dispose();
    _mobileWithDropdownController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppzInputField (defaultType) Examples'),
        // backgroundColor: Colors.teal, // Example theming
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Note: Styling is driven by assets/ui_config.json.\n"
                "To test fallback styles, temporarily rename or corrupt ui_config.json and hot restart.",
                style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              const Text("Default State (Interactive):", style: TextStyle(fontWeight: FontWeight.bold)),
              AppzInputField(
                label: 'Your Name',
                hintText: 'Enter your full name',
                controller: _defaultController,
                fieldType: AppzFieldType.defaultType, // Explicitly defaultType
                // validator: (value) => (value == null || value.isEmpty) ? 'Name is required.' : null,
              ),
              const SizedBox(height: 20),

              const Text("Filled State (Pre-filled):", style: TextStyle(fontWeight: FontWeight.bold)),
              AppzInputField(
                label: 'Company',
                controller: _filledController,
                fieldType: AppzFieldType.defaultType,
                // initialFieldState: AppzFieldState.filled, // State is derived, but can be forced
              ),
              const SizedBox(height: 20),

              const Text("Email (Focus to see focused style):", style: TextStyle(fontWeight: FontWeight.bold)),
              AppzInputField(
                label: 'Email Address',
                hintText: 'you@example.com',
                controller: _emailController,
                fieldType: AppzFieldType.defaultType, // Using defaultType for email input
                // inputType: AppzInputType.emailAddress, // This was from previous version, now handled by fieldType specific logic if needed
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Email is required.';
                  if (!value.contains('@')) return 'Enter a valid email.';
                  return null;
                },
              ),
              const SizedBox(height: 20),

              const Text("Password (Obscured, Error on Empty Submit):", style: TextStyle(fontWeight: FontWeight.bold)),
              AppzInputField(
                label: 'Password',
                hintText: 'Enter your password',
                controller: _passwordController,
                fieldType: AppzFieldType.defaultType,
                obscureText: true,
                validator: (value) => (value == null || value.isEmpty) ? 'Password cannot be empty.' : null,
              ),
              const SizedBox(height: 20),

              const Text("Disabled Input:", style: TextStyle(fontWeight: FontWeight.bold)),
              AppzInputField(
                label: 'Disabled Field',
                controller: _disabledController,
                fieldType: AppzFieldType.defaultType,
                initialFieldState: AppzFieldState.disabled, // Forcing disabled state
              ),
              const SizedBox(height: 20),

              const Text("Error State (Forced via initialFieldState & validator):", style: TextStyle(fontWeight: FontWeight.bold)),
              AppzInputField(
                label: 'Field with Initial Error',
                hintText: 'This field has an error',
                controller: _errorController,
                fieldType: AppzFieldType.defaultType,
                initialFieldState: AppzFieldState.error, // Forcing error state appearance initially
                validator: (value) => 'This is a validation error message.', // Ensures error state persists
              ),
              const SizedBox(height: 20),

              const Text("Mobile Number Input (+91 prefix, 10 digits):", style: TextStyle(fontWeight: FontWeight.bold)),
              AppzInputField(
                label: 'Mobile Number',
                hintText: 'Enter 10-digit number', // Hint for the number part
                controller: _mobileController, // Will store "+91XXXXXXXXXX"
                fieldType: AppzFieldType.mobile,
                // mobileCountryCode: "+91", // Default
                validationType: AppzInputValidationType.mandatory,
                validator: (numberPart) { // This validator receives ONLY the 10-digit number part
                  if (numberPart != null && numberPart.startsWith('0')) {
                    return 'Number should not start with 0.';
                  }
                  // Length (10) and mandatory are already checked by AppzInputField's internal logic
                  // if this validator returns null.
                  return null;
                },
              ),
              const SizedBox(height: 20),

              const Text("Mobile Number with Country Code Dropdown:", style: TextStyle(fontWeight: FontWeight.bold)),
              AppzInputField(
                label: 'Mobile (Dropdown)',
                hintText: 'Enter number',
                controller: _mobileWithDropdownController, // Will store "+XX...XXXXXXXXXX"
                fieldType: AppzFieldType.mobile,
                mobileCountryCodeEditable: true, // Enable dropdown
                mobileCountryCode: "+1", // Start with US as example
                validationType: AppzInputValidationType.mandatory,
                validator: (numberPart) { // Receives only the number part after country code
                  if (numberPart != null && numberPart.contains(RegExp(r'[^0-9]'))) {
                    return 'Number part should only contain digits.';
                  }
                  // Length check will be handled by AppzInputField's internal validation for mobile
                  // if this validator returns null and length is not 10.
                  return null;
                },
              ),
              const SizedBox(height: 20),

              const Text("Aadhaar Input (XXXX XXXX XXXX):", style: TextStyle(fontWeight: FontWeight.bold)),
              AppzInputField(
                label: 'Aadhaar Number',
                // hintText: 'Enter 12-digit Aadhaar', // Default hint is XXXX XXXX XXXX
                controller: _aadhaarController,
                fieldType: AppzFieldType.aadhaar,
                validationType: AppzInputValidationType.mandatory,
              ),
              const SizedBox(height: 20),

              const Text("MPIN Input (4 digits, Obscured, Mandatory):", style: TextStyle(fontWeight: FontWeight.bold)),
              AppzInputField(
                label: 'Enter 4-Digit MPIN',
                controller: _mpinController4digit,
                fieldType: AppzFieldType.mpin,
                obscureText: true,
                mpinLength: 4, // Explicitly 4
                validationType: AppzInputValidationType.mandatory,
                // Validator in AppzInputField already checks for mpinLength and mandatory
              ),
              const SizedBox(height: 20),

              const Text("MPIN Input (6 digits, Visible, Optional):", style: TextStyle(fontWeight: FontWeight.bold)),
              AppzInputField(
                label: 'Set 6-Digit MPIN (Optional)',
                controller: _mpinController6digit,
                fieldType: AppzFieldType.mpin,
                obscureText: false, // Visible digits
                mpinLength: 6,
                validationType: AppzInputValidationType.none, // Not mandatory for this example
                validator: (value) { // Custom validator example
                  if (value != null && value.isNotEmpty && value.length != 6) {
                    return 'If entered, MPIN must be 6 digits.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form is valid! Processing...')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form has errors. Please correct them.')),
                    );
                  }
                },
                child: const Text('Submit Form'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
