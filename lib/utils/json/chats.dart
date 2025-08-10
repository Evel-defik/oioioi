import 'package:oioioi/presentation/chats_page.dart';

class ChatsJson {
  static const List<Map<String, dynamic>> chats = [
    {
      'chat_id': 0,
      'types': ChatTypes.private,
      'image': 'assets/images/saved_massages.png',
      'messages': [
        {
          'message': 'hi',
          'date': 'Fri',
          'time': '10:00',
          'isRead': true,
          'isMe': false,
        },
        {
          'message': 'hello',
          'date': 'Fri',
          'time': '10:01',
          'isRead': true,
          'isMe': true,
        },
        {
          'message': 'how are you?',
          'date': 'Fri',
          'time': '10:02',
          'isRead': true,
          'isMe': false,
        },
        {
          'message': 'I am Jeyson(Arman Americkashka sasat)',
          'date': 'Fri',
          'time': '10:03',
          'isRead': true,
          'isMe': true,
        },
      ],
      'chatName': 'Saved Messages',
      'isPinned': true,
      'isMute': false,
      'isOnline': false,
      'lastSeen': 'just now',
    },
    {
      'chat_id': 1,
      'types': ChatTypes.group,
      'image': 'assets/images/pixels.png',
      'messages': [
        {
          'message': 'sasat',
          'memberName': 'Hasan Web',
          'date': '9/29',
          'time': '14:00',
          'isRead': false,
          'isMe': true,
        }
      ],
      'chatName': 'Pixellz Team',
      'isPinned': true,
      'isMute': false,
      'isOnline': false,
    },
    {
      'chat_id': 2,
      'types': ChatTypes.private,
      'image': 'assets/images/negro.png',
      'messages': [
        {
          'message': 'Let’s choose the first option',
          'date': 'Sun',
          'time': '10:00',
          'isRead': true,
          'isMe': false,
        },
        {
          'message': 'pshl nah',
          'date': 'Sun',
          'time': '10:01',
          'isRead': true,
          'isMe': true,
        },
      ],
      'chatName': 'Joshua Lawrence',
      'isPinned': true,
      'isMute': false,
      'isOnline': false,
    },
    {
      'chat_id': 3,
      'types': ChatTypes.private,
      'image': 'assets/images/negro1.png',
      'messages': [
        {
          'message': 'IMG_0401.PNG',
          'date': 'Sun',
          'time': '10:00',
          'isRead': true,
          'isMe': false,
        },
        {
          'message': 'bibra',
          'date': 'Sun',
          'time': '10:01',
          'isRead': true,
          'isMe': true,
        },
      ],
      'chatName': 'Andrew Parker',
      'isPinned': true,
      'isMute': false,
      'isOnline': true,
    },
    {
      'chat_id': 4,
      'types': ChatTypes.channel,
      'image': 'assets/images/uxlive.png',
      'messages': [
        {
          'message':
              '🤖 Sketch App. 👨‍💻 \n Turn your ideas into incredible wor…',
          'date': 'Sun',
          'time': '11:30',
          'isRead': true,
          'isMe': false,
        },
        {
          'message': 'bibra',
          'date': 'Sun',
          'time': '11:30',
          'isRead': true,
          'isMe': true,
        },
      ],
      'chatName': 'UX Live',
      'isPinned': true,
      'isMute': true,
      'counter': 153,
    },
    {
      'chat_id': 5,
      'types': ChatTypes.private,
      'image': 'assets/images/albert.png',
      'messages': [
        {
          'message': 'What about a super i',
          'date': 'Sun',
          'time': '11:30',
          'isRead': true,
          'isMe': false,
        },
      ],
      'chatName': 'Albert Lasker',
      'isPinned': true,
      'isMute': false,
      'isOnline': true,
    },
    {
      'chat_id': 6,
      'types': ChatTypes.bot,
      'image': 'assets/images/ustrations.png',
      'messages': [
        {
          'message': 'Photo',
          'date': 'Sun',
          'time': '10:42',
          'isRead': true,
          'isMe': false,
        },
      ],
      'chatName': 'Ustrations',
      'isPinned': true,
      'isMute': false,
      'isOnline': false,
      'counter': 17,
    },
    {
      'chat_id': 7,
      'types': ChatTypes.channel,
      'image': 'assets/images/plugins.png',
      'messages': [
        {
          'message':
              '👋 IOS 13 Design Kit.\nTurn your ideas into incredible wor…',
          'date': 'Sat',
          'time': '10:42',
          'isRead': true,
          'isMe': false,
        },
      ],
      'chatName': 'Figma Plugins',
      'isPinned': true,
      'isRead': false,
      'isMute': true,
      'counter': 153,
    },
  ];
}
