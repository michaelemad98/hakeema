class Language{
  int ?id;
  String ?name;
  String ?languagecode;
  Language(this.id,this.name,this.languagecode);
  static List<Language> languageList(){
    return <Language>[
      Language(1, 'English', 'en'),
      Language(2, 'العربية', 'ar')
    ];
  }
}