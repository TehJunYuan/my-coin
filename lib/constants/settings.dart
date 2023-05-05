/*
  Settings class
  - store the text
  Last updated: 15 Apr 2023
*/
class Settings {
  final List<String> basicSettings = [
    'Personal Information',
    'Notification',
    'Theme',
    'General Settings',
    'Account Verfication',
  ];
  String getBasicSettingsText(int count){
    return basicSettings[count];
  }
}