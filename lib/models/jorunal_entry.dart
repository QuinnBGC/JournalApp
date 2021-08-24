class JournalEntry {
  final String title;
  final String body; 
  final String date;

  JournalEntry({this.title, this.body, this.date});
  
  String toString() {
    return 'Title: $title, Body: $body, Date: $date';
  }
}