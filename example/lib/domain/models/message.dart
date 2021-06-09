class Message {
  String? msgId;
  String? title;
  String? content;


  Message({this.msgId, this.title, this.content});

  @override
  String toString() {
    return 'Message{msgId: $msgId, title: $title, content: $content}';
  }
}
