import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    // English
    'en_US': {
      'app_title': 'Todo',
      'add_todo': 'Add Todo',
      'edit_todo': 'Edit Todo',
      'hint_title': 'What do you need to do?',
      'save': 'Save',
      'cancel': 'Cancel',
      'empty': 'No tasks yet. Add one!',
      'theme': 'Theme',
      'language': 'Language',
      'clear_completed': 'Clear completed',
    },

    // French
    'fr_FR': {
      'app_title': 'Tâches',
      'add_todo': 'Ajouter une tâche',
      'edit_todo': 'Modifier la tâche',
      'hint_title': 'Que devez-vous faire ?',
      'save': 'Enregistrer',
      'cancel': 'Annuler',
      'empty': 'Aucune tâche pour l’instant. Ajoutez-en une !',
      'theme': 'Thème',
      'language': 'Langue',
      'clear_completed': 'Effacer les tâches terminées',
    },

    // Hindi
    'hi_IN': {
      'app_title': 'टूडू',
      'add_todo': 'काम जोड़ें',
      'edit_todo': 'काम संपादित करें',
      'hint_title': 'आपको क्या करना है?',
      'save': 'सेव',
      'cancel': 'रद्द करें',
      'empty': 'अभी तक कोई काम नहीं है। एक जोड़ें!',
      'theme': 'थीम',
      'language': 'भाषा',
      'clear_completed': 'पूरा हुआ हटाएँ',
    },
  };
}
