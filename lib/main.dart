import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GreetingCardScreen(),
    );
  }
}

class GreetingCardScreen extends StatefulWidget {
  @override
  _GreetingCardScreenState createState() => _GreetingCardScreenState();
}

class _GreetingCardScreenState extends State<GreetingCardScreen> {
  final _nameController = TextEditingController();
  final _messageController = TextEditingController();
  final _senderController = TextEditingController();
  String _greetingMessage = "";
  int _backgroundIndex = 0;
  final List<String> _backgrounds = [
    'assets/background1.jpeg',
    'assets/background2.jpeg',
    'assets/background3.jpg',
    'assets/background4.jpeg',
    'assets/background5.jpeg',
    'assets/background6.jpeg',
    'assets/background7.jpeg',
  ];

  void _generateCard() {
    setState(() {
      _greetingMessage =
      "Dear, ${_nameController.text}!\n${_messageController.text}";
    });
  }

  void _changeBackground() {
    setState(() {
      _backgroundIndex = (_backgroundIndex + 1) % _backgrounds.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cardmaker.com'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _nameController.clear();
                _messageController.clear();
                _senderController.clear();
                _greetingMessage = "";
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Make Someone’s Day with a Custom Card!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'GaramondItalic',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Image.asset(
                'assets/icon.png',
                color: Colors.pink[300],
                height: 50,
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'To',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(fontSize: 18, fontFamily: 'Garamond'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _senderController,
                decoration: InputDecoration(
                  labelText: 'From (Your Name)',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(fontSize: 18, fontFamily: 'Garamond'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  labelText: 'Your Message',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(fontSize: 18, fontFamily: 'Garamond'),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _generateCard,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[300],
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    child: Text('Create Card'),
                  ),
                  ElevatedButton(
                    onPressed: _changeBackground,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[300],
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    child: Text(' Change Theme'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (_greetingMessage.isNotEmpty)
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(_backgrounds[_backgroundIndex]),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'GaramondResult'),
                          children: [
                            TextSpan(text: "Dear, "),
                            TextSpan(
                              text: "${_nameController.text}!\n",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: _messageController.text),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "- ${_senderController.text}",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'GaramondResult',
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
