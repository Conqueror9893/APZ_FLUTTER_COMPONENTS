// Defines the data model for a country, used for country code selection.
class CountryModel {
  final String isoCode; // e.g., "IN"
  final String name;    // e.g., "India"
  final String phoneCode; // e.g., "91" (digits only)
  final String flagEmoji; // e.g., "🇮🇳"

  const CountryModel({
    required this.isoCode,
    required this.name,
    required this.phoneCode,
    required this.flagEmoji,
  });

  // For DropdownButtonFormField value comparison
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CountryModel &&
        other.isoCode == isoCode &&
        other.phoneCode == phoneCode;
  }

  @override
  int get hashCode => isoCode.hashCode ^ phoneCode.hashCode;

  String get displayDialCode => "+${phoneCode}";
}
