
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageTranslationPage extends StatefulWidget {
  _LanguageTranslationState createState() => _LanguageTranslationState();
}

class _LanguageTranslationState extends State<LanguageTranslationPage> {
  // var languages = ['Hindi', 'English', 'Sanskrit'];

  var languages = [
    'English',
    'Hindi',
    'Bengali',
    'Gujarati',
    'Kannada',
    'Malayalam',
    'Marathi',
    'Nepali',
    'Punjabi',
    'Tamil',
    'Telugu',
    'Urdu',
  ];








  var originLanguage = "From";
  var destinationLanguage = "To";
  var output = "";
  TextEditingController languageController = TextEditingController();

  void translate(String src, String dest, String input) async {
    GoogleTranslator translator = GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: dest);
    setState(() {
      output = translation.text.toString();
    });
    if (src == '--' || dest == '--') {
      setState(() {
        output = 'Failed to translate';
      });
    }
  }

  // String getLanguageCoe(String language) {
  //   if (language == "English") {
  //     return "en";
  //   } else if (language == "Hindi") {
  //     return "hi";
  //   } else if (language == "Sanskrit") {
  //     return "sa";
  //   }
  //   return "--";
  // }


  String getLanguageCode(String language) {
    if (language == "English") {
      return "en";
    } else if (language == "Hindi") {
      return "hi";
    } else if (language == "Bengali") {
      return "bn";
    } else if (language == "Gujarati") {
      return "gu";
    } else if (language == "Kannada") {
      return "kn";
    } else if (language == "Malayalam") {
      return "ml";
    } else if (language == "Marathi") {
      return "mr";
    } else if (language == "Nepali") {
      return "ne";
    } else if (language == "Punjabi") {
      return "pa";
    } else if (language == "Tamil") {
      return "ta";
    } else if (language == "Telugu") {
      return "te";
    } else if (language == "Urdu") {
      return "ur";
    }
    return "--"; // agar language match nahi hui
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff10223d),
      appBar: AppBar(
        title: const Text('Language Translator',style: TextStyle(
          color: Colors.white,
        ),),
        centerTitle: true,
        backgroundColor: const Color(0xff1c3357),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: DropdownButton(
                      dropdownColor: const Color(0xff1c3357),
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      focusColor: Colors.white,
                      iconDisabledColor: Colors.white,
                      iconEnabledColor: Colors.white,
                      hint: Text(
                        originLanguage,
                        style: const TextStyle(color: Colors.white),
                      ),
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.white),
                      items: languages.map((String dropDownStringItem) {
                        return DropdownMenuItem(
                          value: dropDownStringItem,
                          child: Text(
                            dropDownStringItem,
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          originLanguage = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 40),
                  const Icon(Icons.arrow_right_alt_outlined,
                      color: Colors.white, size: 40),
                  const SizedBox(width: 40),
                  Flexible(
                    child: DropdownButton(
                      dropdownColor: const Color(0xff1c3357),
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      focusColor: Colors.white,
                      iconDisabledColor: Colors.white,
                      iconEnabledColor: Colors.white,
                      hint: Text(
                        destinationLanguage,
                        style: const TextStyle(color: Colors.white),
                      ),
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.white),
                      items: languages.map((String dropDownStringItem) {
                        return DropdownMenuItem(
                          value: dropDownStringItem,
                          child: Text(
                            dropDownStringItem,
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          destinationLanguage = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  cursorColor: Colors.white,
                  autofocus: false,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xff1c3357),
                    labelText: 'Please enter your text..',
                    labelStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                      const BorderSide(color: Colors.white70, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.white70),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                      const BorderSide(color: Colors.lightBlueAccent),
                    ),
                    errorStyle:
                    const TextStyle(color: Colors.red, fontSize: 15),
                  ),
                  controller: languageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter text to translate ';
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2b3c5a),
                    foregroundColor: Colors.white,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    translate(
                      getLanguageCode(originLanguage),
                      getLanguageCode(destinationLanguage),
                      languageController.text.toString(),
                    );
                  },
                  child: const Text(
                    'Translate',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "\n$output",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.lightGreenAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
