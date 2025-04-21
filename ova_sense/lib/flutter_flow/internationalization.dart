import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
    String? esText = '',
  }) =>
      [enText, hiText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Info1
  {
    'abkg14h9': {
      'en': 'How OvaSense Works',
      'es': 'Cómo funciona OvaSense',
      'hi': 'ओवासेंस कैसे काम करता है',
    },
    'k5sjapxa': {
      'en':
          ' We analyze your daily health inputs and smartwatch data to spot early signs of PCOS or PCOD.',
      'es':
          'Analizamos tus datos de salud diarios y los datos de tu reloj inteligente para detectar signos tempranos de SOP o SOP.',
      'hi':
          'हम पीसीओएस या पीसीओडी के शुरुआती लक्षणों का पता लगाने के लिए आपकी दैनिक स्वास्थ्य जानकारी और स्मार्टवॉच डेटा का विश्लेषण करते हैं।',
    },
    'n05f5z7t': {
      'en': 'Skip',
      'es': 'Saltar',
      'hi': 'छोडना',
    },
    'awfxnxpw': {
      'en': 'Next',
      'es': 'Próximo',
      'hi': 'अगला',
    },
    'f239dnmk': {
      'en': 'Home',
      'es': 'Hogar',
      'hi': 'घर',
    },
  },
  // Info2
  {
    'aa6xlqd7': {
      'en': ' Just 1 Minute a Day',
      'es': 'Sólo 1 minuto al día',
      'hi': 'बस 1 मिनट प्रतिदिन',
    },
    'wbkkhfoi': {
      'en':
          'Fill out a short form daily with your symptoms and habits. The more consistent, the better!',
      'es':
          'Complete un breve formulario a diario con sus síntomas y hábitos. ¡Cuanto más constante, mejor!',
      'hi':
          'अपने लक्षणों और आदतों के बारे में प्रतिदिन एक छोटा सा फॉर्म भरें। जितना अधिक सुसंगत होगा, उतना बेहतर होगा!',
    },
    'lqc4xcwz': {
      'en': 'Skip',
      'es': 'Saltar',
      'hi': 'छोडना',
    },
    'dfgtdlxg': {
      'en': 'Next',
      'es': 'Próximo',
      'hi': 'अगला',
    },
    'vwgft0b7': {
      'en': 'Home',
      'es': 'Hogar',
      'hi': 'घर',
    },
  },
  // Info3
  {
    'kj0hinhb': {
      'en': 'Your Data = Your Control',
      'es': 'Tus datos = tu control',
      'hi': 'आपका डेटा = आपका नियंत्रण',
    },
    'cspd3vfi': {
      'en':
          'We respect your privacy. Your data is secure, and only you (or your doctor) can access it.',
      'es':
          'Respetamos su privacidad. Sus datos están seguros y solo usted (o su médico) puede acceder a ellos.',
      'hi':
          'हम आपकी गोपनीयता का सम्मान करते हैं। आपका डेटा सुरक्षित है, और केवल आप (या आपका डॉक्टर) ही इसे एक्सेस कर सकते हैं।',
    },
    'tp0doph5': {
      'en': 'Skip',
      'es': 'Saltar',
      'hi': 'छोडना',
    },
    'c3qwn4i9': {
      'en': 'Next',
      'es': 'Próximo',
      'hi': 'अगला',
    },
    'es97dhps': {
      'en': 'Home',
      'es': 'Hogar',
      'hi': 'घर',
    },
  },
  // Info4
  {
    'eai43w1n': {
      'en': 'Lets Begin',
      'es': 'Vamos a empezar',
      'hi': 'चलो शुरू करें',
    },
    'dg4dtah2': {
      'en': 'AI + You = Smarter Health Awareness.',
      'es': 'IA + Tú = Conciencia de salud más inteligente.',
      'hi': 'एआई + आप = बेहतर स्वास्थ्य जागरूकता।',
    },
    '0d906oxh': {
      'en': 'Continue',
      'es': 'Continuar',
      'hi': 'जारी रखना',
    },
    'gfghsueh': {
      'en': 'Home',
      'es': 'Hogar',
      'hi': 'घर',
    },
  },
  // Splash
  {
    'izwejc8e': {
      'en': 'Welcome to OvaSense',
      'es': 'Bienvenido a OvaSense',
      'hi': 'ओवासेंस में आपका स्वागत है',
    },
    'wmsi4gxk': {
      'en': 'Your smart companion for early PCOS/PCOD detection.',
      'es': 'Su compañero inteligente para la detección temprana del SOP/ODPC.',
      'hi': 'पीसीओएस/पीसीओडी का शीघ्र पता लगाने के लिए आपका स्मार्ट साथी।',
    },
    'e74b938o': {
      'en': 'Lets Begin',
      'es': 'Vamos a empezar',
      'hi': 'चलो शुरू करें',
    },
    '64ewqhew': {
      'en': 'Home',
      'es': 'Hogar',
      'hi': 'घर',
    },
  },
  // ChatBot
  {
    'lqfm9gns': {
      'en': 'OvaSense Chat Help',
      'es': 'Ayuda del chat de OvaSense',
      'hi': 'OvaSense चैट सहायता',
    },
    '2ik7dokz': {
      'en': 'Enter Your Query',
      'es': 'Ingrese su consulta',
      'hi': 'अपना प्रश्न दर्ज करें',
    },
    'swsp23gw': {
      'en': 'ChatBot',
      'es': 'Chatbot',
      'hi': 'चैटबॉट',
    },
  },
  // Explore
  {
    '8mhc769a': {
      'en': 'OvaSense Recommendations',
      'es': 'Recomendaciones de OvaSense',
      'hi': 'ओवासेंस अनुशंसाएँ',
    },
    'jubliob6': {
      'en': 'YouTube Guide',
      'es': 'Guía de YouTube',
      'hi': 'यूट्यूब गाइड',
    },
    '5lt55m2a': {
      'en': 'Blogs and Articles',
      'es': 'Blogs y artículos',
      'hi': 'ब्लॉग और लेख',
    },
    'dkukxnnh': {
      'en': 'More Videos',
      'es': 'Más vídeos',
      'hi': 'और वीडियो',
    },
    '9ukmmtz8': {
      'en': 'Explore',
      'es': 'Explorar',
      'hi': 'अन्वेषण करना',
    },
  },
  // Profile
  {
    'ie0amuqd': {
      'en': 'User',
      'es': 'Usuario',
      'hi': 'उपयोगकर्ता',
    },
    'edc67taa': {
      'en': 'Personal  Details',
      'es': 'Datos personales',
      'hi': 'व्यक्तिगत विवरण',
    },
    'r5boe684': {
      'en': 'Age(yrs)',
      'es': 'Edad (años)',
      'hi': 'आयु(वर्ष)',
    },
    'zw6b7j59': {
      'en': 'Enter Your Age',
      'es': 'Ingrese su edad',
      'hi': 'अपनी आयु दर्ज करें',
    },
    '1ktzsizw': {
      'en': 'Weight(kg)',
      'es': 'Peso (kg)',
      'hi': 'वजन (किलोग्राम)',
    },
    'i5bzbry9': {
      'en': 'Enter Your Weight (kg)',
      'es': 'Ingrese su peso (kg)',
      'hi': 'अपना वजन (किलोग्राम) दर्ज करें',
    },
    'gqtczf07': {
      'en': 'Height(cm)',
      'es': 'Altura (cm)',
      'hi': 'ऊंचाई(सेमी)',
    },
    '6t5cunpi': {
      'en': 'Enter Your Height(cm)',
      'es': 'Ingrese su altura (cm)',
      'hi': 'अपनी ऊंचाई(सेमी) दर्ज करें',
    },
    '5k3y0znp': {
      'en': 'Cycle Regularity ',
      'es': 'Regularidad del ciclo',
      'hi': 'चक्र नियमितता',
    },
    'cwg9kii1': {
      'en': 'Search...',
      'es': 'Buscar...',
      'hi': 'खोज...',
    },
    'ju85tdjl': {
      'en': 'Regular',
      'es': 'Regular',
      'hi': 'नियमित',
    },
    'q1m0ctyg': {
      'en': 'Irregular',
      'es': 'Irregular',
      'hi': 'अनियमित',
    },
    '0ho9ff1l': {
      'en': 'Cycle length (days) ',
      'es': 'Duración del ciclo (días)',
      'hi': 'चक्र की लंबाई (दिन)',
    },
    'v7kce166': {
      'en': 'Cycle length  (Average between periods)',
      'es': 'Duración del ciclo (promedio entre períodos)',
      'hi': 'चक्र की लंबाई (अवधि के बीच औसत)',
    },
    'ffnyi0i4': {
      'en': 'AHM Levels',
      'es': 'Niveles AHM',
      'hi': 'एएचएम स्तर',
    },
    'n091qpuc': {
      'en': 'AHM Levels (ng/mL)',
      'es': 'Niveles de AHM (ng/mL)',
      'hi': 'एएचएम स्तर (एनजी/एमएल)',
    },
    'rut101jd': {
      'en': 'Hair Growth?',
      'es': '¿Crecimiento del cabello?',
      'hi': 'बाल विकास?',
    },
    'i7ydbinw': {
      'en': 'Search...',
      'es': 'Buscar...',
      'hi': 'खोज...',
    },
    '8kn9qxk8': {
      'en': 'Yes',
      'es': 'Sí',
      'hi': 'हाँ',
    },
    '8wdq7nfo': {
      'en': 'No',
      'es': 'No',
      'hi': 'नहीं',
    },
    'bzmssnbm': {
      'en': 'Pimples',
      'es': 'Granos',
      'hi': 'मुंहासे',
    },
    'zpkcyjfg': {
      'en': 'Search...',
      'es': 'Buscar...',
      'hi': 'खोज...',
    },
    '4evo0czf': {
      'en': 'Yes',
      'es': 'Sí',
      'hi': 'हाँ',
    },
    'by9co78e': {
      'en': 'No',
      'es': 'No',
      'hi': 'नहीं',
    },
    'gawneglr': {
      'en': 'Skin Darkening?',
      'es': '¿Oscurecimiento de la piel?',
      'hi': 'त्वचा का रंग काला पड़ना?',
    },
    'oglsr5hq': {
      'en': 'Search...',
      'es': 'Buscar...',
      'hi': 'खोज...',
    },
    'vq08levg': {
      'en': 'Yes',
      'es': 'Sí',
      'hi': 'हाँ',
    },
    'gzsnsczu': {
      'en': 'No',
      'es': 'No',
      'hi': 'नहीं',
    },
    'f5r60fcd': {
      'en': 'Hair Loss?',
      'es': '¿Perdida de cabello?',
      'hi': 'बालों का झड़ना?',
    },
    'ef8rjde4': {
      'en': 'Search...',
      'es': 'Buscar...',
      'hi': 'खोज...',
    },
    'd83cbrto': {
      'en': 'Yes',
      'es': 'Sí',
      'hi': 'हाँ',
    },
    'q7wbpgoz': {
      'en': 'No',
      'es': 'No',
      'hi': 'नहीं',
    },
    '053h0heu': {
      'en': 'Weight Gain',
      'es': 'Aumento de peso',
      'hi': 'भार बढ़ना',
    },
    '0thqsc7z': {
      'en': 'Search...',
      'es': 'Buscar...',
      'hi': 'खोज...',
    },
    '8pgc5xj4': {
      'en': 'Yes',
      'es': 'Sí',
      'hi': 'हाँ',
    },
    '2isf1are': {
      'en': 'No',
      'es': 'No',
      'hi': 'नहीं',
    },
    'twp2vu9j': {
      'en': 'Do you consume Fast Food Items on a regular Basis?',
      'es': '¿Consumes comida rápida habitualmente?',
      'hi': 'क्या आप नियमित रूप से फास्ट फूड आइटम का सेवन करते हैं?',
    },
    '04c4j5fh': {
      'en': 'Search...',
      'es': 'Buscar...',
      'hi': 'खोज...',
    },
    'gcg0dcim': {
      'en': 'Yes',
      'es': 'Sí',
      'hi': 'हाँ',
    },
    'k5ol55gl': {
      'en': 'No',
      'es': 'No',
      'hi': 'नहीं',
    },
    '2hktdwqh': {
      'en': 'Do you exercise regularly?',
      'es': '¿Haces ejercicio regularmente?',
      'hi': 'क्या आप नियमित रूप से व्यायाम करते हैं?',
    },
    'xkv7hczy': {
      'en': 'Search...',
      'es': 'Buscar...',
      'hi': 'खोज...',
    },
    '4k7pk4iw': {
      'en': 'Yes',
      'es': 'Sí',
      'hi': 'हाँ',
    },
    'mb7ks06g': {
      'en': 'No',
      'es': 'No',
      'hi': 'नहीं',
    },
    '12x2xgrl': {
      'en': 'Select Last Period Date',
      'es': 'Seleccionar la fecha del último período',
      'hi': 'अंतिम अवधि तिथि चुनें',
    },
    '11i7krr6': {
      'en': 'Save and Continue',
      'es': 'Guardar y continuar',
      'hi': 'सहेजें और जारी रखें',
    },
    'yrdq52v7': {
      'en': 'Profile',
      'es': 'Perfil',
      'hi': 'प्रोफ़ाइल',
    },
  },
  // login
  {
    '147jtsfk': {
      'en': 'OvaSense',
      'es': 'OvaSense',
      'hi': 'ओवासेंस',
    },
    'c4lxhruv': {
      'en': 'Sign In',
      'es': 'Iniciar sesión',
      'hi': 'दाखिल करना',
    },
    'w1gpmihg': {
      'en': 'Let\'s get started by filling out the form below.',
      'es': 'Comencemos rellenando el formulario que aparece a continuación.',
      'hi': 'आइये नीचे दिया गया फॉर्म भरकर शुरुआत करें।',
    },
    '4lw8y2cb': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'hi': 'ईमेल',
    },
    'm89xlb78': {
      'en': 'Password',
      'es': 'Contraseña',
      'hi': 'पासवर्ड',
    },
    'emmz5v39': {
      'en': 'Sign In',
      'es': 'Iniciar sesión',
      'hi': 'दाखिल करना',
    },
    'xn4kvpgs': {
      'en': 'Forgot Password',
      'es': 'Has olvidado tu contraseña',
      'hi': 'पासवर्ड भूल गए',
    },
    'aba1ekoz': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
      'hi': 'साइन अप करें',
    },
    '3lmdn8jt': {
      'en': 'Let\'s get started by filling out the form below.',
      'es': 'Comencemos rellenando el formulario que aparece a continuación.',
      'hi': 'आइये नीचे दिया गया फॉर्म भरकर शुरुआत करें।',
    },
    'spcwfu1s': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'hi': 'ईमेल',
    },
    'xp9rlpmp': {
      'en': 'Password',
      'es': 'Contraseña',
      'hi': 'पासवर्ड',
    },
    '73r0icr4': {
      'en': 'Confirm Password',
      'es': 'confirmar Contraseña',
      'hi': 'पासवर्ड की पुष्टि कीजिये',
    },
    '8mj83l4m': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'hi': 'खाता बनाएं',
    },
    'i96tntc6': {
      'en': 'Home',
      'es': 'Hogar',
      'hi': 'घर',
    },
  },
  // Miscellaneous
  {
    '86zszqmy': {
      'en': '',
      'es': '',
      'hi': '',
    },
    '5rpk969j': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'c7z6qult': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'zn2e1vqd': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'lxmy0sds': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'egzbzu3o': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'y9b4rgr2': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'hpe265ga': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'eg9ne530': {
      'en': '',
      'es': '',
      'hi': '',
    },
    '732hyl7z': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'lqe6j39x': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'k41r4u9g': {
      'en': '',
      'es': '',
      'hi': '',
    },
    '0fuvrfef': {
      'en': '',
      'es': '',
      'hi': '',
    },
    '1z557q7a': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'k8wozi30': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'mftyociy': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'nj1j0c10': {
      'en': '',
      'es': '',
      'hi': '',
    },
    '42syda6l': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'g2iplva3': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'ydbsu0e0': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'zco3kbym': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'gxr078i0': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'oenmne70': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'sojs0di7': {
      'en': '',
      'es': '',
      'hi': '',
    },
    'bdc7gx80': {
      'en': '',
      'es': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
