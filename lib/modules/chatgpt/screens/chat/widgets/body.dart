part of '../chat_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var uuid = const Uuid();
  var messageController = TextEditingController();

  void chatComplete() async {
    String text = messageController.text == Null ? '' : messageController.text;

    final chat = await client.chat.create(
      model: 'gpt-3.5-turbo',
      messages: const [
        // ChatMessage(
        //   role: 'user',
        //   content: text,
        // )
      ],
    ).data;

    print(chat);
  }

  static final configuration = OpenAIConfiguration(
    apiKey: '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',
  );

  final client = OpenAIClient(
    configuration: configuration,
    enableLogging: true,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatComplete();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    String id = '1';

    List<MessageModel> mymessages = [
      MessageModel(
        text: 'hahehus',
        messageid: uuid.v1(),
        sender: '1',
        createdon: DateTime.now(),
      ),
      MessageModel(
        text: 'hahehus',
        messageid: uuid.v1(),
        sender: '2',
        createdon: DateTime.now(),
      ),
    ];

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
