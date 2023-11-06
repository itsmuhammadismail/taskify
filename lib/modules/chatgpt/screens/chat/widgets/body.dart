part of '../chat_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var uuid = const Uuid();
  var messageController = TextEditingController();

  String id = '1';

  List<MessageModel> mymessages = [
    // MessageModel(
    //   text: 'hahehus',
    //   messageid: uuid.v1(),
    //   sender: '1',
    //   createdon: DateTime.now(),
    // ),
    // MessageModel(
    //   text: 'hahehus',
    //   messageid: uuid.v1(),
    //   sender: '2',
    //   createdon: DateTime.now(),
    // ),
  ];

  static final configuration = OpenAIConfiguration(
    apiKey: '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',
  );

  final client = OpenAIClient(
    configuration: configuration,
    enableLogging: true,
  );

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    void chatComplete() async {
      if (messageController.text != '') {
        String text = messageController.text;

        setState(() {
          mymessages.insert(
              0,
              MessageModel(
                text: text,
                messageid: uuid.v1(),
                sender: '2',
                createdon: DateTime.now(),
              ));
        });
        setState(() {
          mymessages.insert(
              0,
              MessageModel(
                text: "• • •",
                messageid: uuid.v1(),
                sender: '1',
                createdon: DateTime.now(),
              ));
        });

        final chat = await client.chat.create(
          model: 'gpt-3.5-turbo',
          messages: [
            ChatMessage(
              role: 'user',
              content: text,
            )
          ],
        ).data;

        setState(() {
          mymessages[0] = MessageModel(
            text: chat.choices[0].message.content,
            messageid: uuid.v1(),
            sender: '1',
            createdon: DateTime.now(),
          );
        });

        print(chat.choices[0].message.content);
      }
    }

    return SafeArea(
        child: Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                  reverse: true,
                  itemCount: mymessages.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: (mymessages[index].sender == id)
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Container(
                            constraints:
                                BoxConstraints(minWidth: 100, maxWidth: 300),
                            margin: EdgeInsets.symmetric(
                              vertical: 2,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: (mymessages[index].sender == id)
                                  ? Colors.grey
                                  : kPrimaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              mymessages[index].text.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                      ],
                    );
                  }),
            ),
          ),
          Container(
            color: themeChange.darkTheme ? Colors.grey[800] : Colors.grey[200],
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: messageController,
                    maxLines: null,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Enter message"),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // sendMessage();
                    chatComplete();
                  },
                  icon: Icon(
                    Icons.send,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
