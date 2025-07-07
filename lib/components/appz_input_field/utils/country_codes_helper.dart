import 'package:phonecodes/phonecodes.dart' as pc; // Using an alias to avoid conflict if any
import 'country_model.dart';

class CountryCodesHelper {
  static List<CountryModel>? _countries;

  static List<CountryModel> getCountries() {
    if (_countries == null) {
      _countries = pc.Country.values.map((country) {
        return CountryModel(
          isoCode: country.code, // Typically 2-letter ISO code
          name: country.name,   // Full name of the country
          phoneCode: country.dialCode.replaceAll('+', ''), // Store without '+'
          flagEmoji: country.flag, // Emoji flag
        );
      }).toList();

      // Optional: Sort by name or phone code if desired
      _countries!.sort((a, b) => a.name.compareTo(b.name));
    }
    return _countries!;
  }

  static CountryModel? getCountryByDialCode(String dialCode) {
    final String searchCode = dialCode.replaceAll('+', '');
    try {
      return getCountries().firstWhere((country) => country.phoneCode == searchCode);
    } catch (e) {
      return null; // Not found
    }
  }
   static CountryModel getDefaultCountry() {
    // Prioritize India, then US, then first in list as fallback
    return getCountryByDialCode("91") ?? getCountryByDialCode("1") ?? getCountries().first;
  }
}
