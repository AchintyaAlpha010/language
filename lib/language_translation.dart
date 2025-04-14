import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageTranslationPage extends StatefulWidget {
  const LanguageTranslationPage({Key? key}) : super(key: key);

  @override
  State<LanguageTranslationPage> createState() =>
      _LanguageTranslationState();
}

class _LanguageTranslationState extends State<LanguageTranslationPage> {
  // Map of supported languages and their codes
  final Map<String, String> languageMap = {
    "English": "en",
    "Hindi": "hi",
    "Bengali": "bn",
    "Tamil": "ta",
    "Telugu": "te",
    "Marathi": "mr",
    "Gujarati": "gu",
    "Punjabi": "pa",
    "Malayalam": "ml",
    "Kannada": "kn",
    "Vietnamese": "vi",
    "Thai": "th",
    "Swahili": "sw",
    "Malay": "ms",
    "Serbian": "sr",
    "Croatian": "hr",
    "Bulgarian": "bg",
    "Romanian": "ro",
    "Slovak": "sk",
    "Lithuanian": "lt",
    "Latvian": "lv",
    "Arabic": "ar",
    "Spanish": "es",
    "French": "fr",
    "German": "de",
    "Chinese (Simplified)": "zh-cn",
    "Chinese (Traditional)": "zh-tw",
    "Japanese": "ja",
    "Russian": "ru",
    "Korean": "ko",
    "Portuguese": "pt",
    "Italian": "it",
    "Dutch": "nl",
    "Turkish": "tr",
    "Swedish": "sv",
    "Polish": "pl",
    "Greek": "el",
    "Czech": "cs",
    "Danish": "da",
    "Finnish": "fi",
    "Norwegian": "no",
    "Hungarian": "hu",
  };

  var originlanguage = "From";
  var destinationlanguage = 'To';
  var output = "";
  TextEditingController languageController = TextEditingController();
  bool isDarkTheme = false;

  // Function to translate text
  void translate(String src, String dest, String input) async {
    if (src == '--' || dest == '--') {
      setState(() {
        output = "Failed to translate";
      });
      return;
    }

    try {
      GoogleTranslator translator = GoogleTranslator();
      var translation = await translator.translate(input, from: src, to: dest);
      setState(() {
        output = translation.text.toString();
      });
    } catch (e) {
      setState(() {
        output = "An error occurred during translation.";
      });
    }
  }

  // Fetch language code from the map
  String getLanguageCode(String language) {
    return languageMap[language] ?? "--";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkTheme ? Colors.black : Color(0xfff4f6fc),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.translate, color: Colors.white),
            SizedBox(width: 8),
            Text(
              "Language Translator",
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color(0xff0a1931),
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              isDarkTheme ? Colors.grey[900]! : Color(0xffedf3fb),
              isDarkTheme ? Colors.grey[850]! : Color(0xffc7dffe),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dark Theme",
                      style: TextStyle(color: isDarkTheme ? Colors.white : Color(0xff0a1931)),
                    ),
                    Switch(
                      value: isDarkTheme,
                      onChanged: (bool value) {
                        setState(() {
                          isDarkTheme = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: isDarkTheme ? Colors.grey[850] : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: isDarkTheme ? Colors.grey[850] : Colors.white,
                              icon: Icon(Icons.language, color: isDarkTheme ? Colors.white : Color(0xff0a1931)),
                              hint: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  originlanguage,
                                  style: TextStyle(
                                    color: isDarkTheme ? Colors.white : Color(0xff0a1931),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              isExpanded: true,
                              items: languageMap.keys.toList().map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8),
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        color: isDarkTheme ? Colors.white : Color(0xff0a1931),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  originlanguage = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(Icons.arrow_forward, size: 30, color: isDarkTheme ? Colors.white : Color(0xff0a1931)),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: isDarkTheme ? Colors.grey[850] : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: isDarkTheme ? Colors.grey[850] : Colors.white,
                              icon: Icon(Icons.language, color: isDarkTheme ? Colors.white : Color(0xff0a1931)),
                              hint: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  destinationlanguage,
                                  style: TextStyle(
                                    color: isDarkTheme ? Colors.white : Color(0xff0a1931),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              isExpanded: true,
                              items: languageMap.keys.toList().map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8),
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        color: isDarkTheme ? Colors.white : Color(0xff0a1931),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  destinationlanguage = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    cursorColor: isDarkTheme ? Colors.white : Color(0xff0a1931),
                    autofocus: false,
                    style: TextStyle(color: isDarkTheme ? Colors.white : Color(0xff0a1931)),
                    decoration: InputDecoration(
                      labelText: 'Enter text to translate',
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: isDarkTheme ? Colors.white : Color(0xff0a1931),
                      ),
                      fillColor: isDarkTheme ? Colors.grey[850] : Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                          color: isDarkTheme ? Colors.white : Color(0xff0a1931),
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                            color: isDarkTheme ? Colors.white : Color(0xff0a1931),
                            width: 1),
                      ),
                      errorStyle:
                          TextStyle(color: Colors.red, fontSize: 15),
                    ),
                    controller: languageController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter text to translate';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xfff9a826),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      elevation: 8,
                    ),
                    onPressed: () {
                      translate(
                        getLanguageCode(originlanguage),
                        getLanguageCode(destinationlanguage),
                        languageController.text.toString(),
                      );
                    },
                    child: Text(
                      "Translate",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDarkTheme ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          output.isEmpty
                              ? "Translation will appear here"
                              : output,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isDarkTheme ? Colors.white : Color(0xff0a1931),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
