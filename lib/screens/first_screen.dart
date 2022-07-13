import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final nameInputController = TextEditingController();
  final palindromeInputController = TextEditingController();

  void isPalindrome() {
    var reversedString =
        palindromeInputController.text.split('').reversed.join();
    if (reversedString == palindromeInputController.text) {
      showAlertDialog("It's Palindrome");
    } else {
      showAlertDialog("Not Palindrome");
    }
  }

  void showAlertDialog(String content) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(content),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Ok"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameInputController.dispose();
    palindromeInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/first_screen_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    color: Colors.white.withOpacity(0.3),
                  ),
                  padding: const EdgeInsets.all(50),
                  child: const Icon(
                    Icons.add_a_photo,
                    size: 36,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                TextField(
                  controller: nameInputController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12, width: 0.0),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12, width: 0.0),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Name",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: palindromeInputController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12, width: 0.0),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12, width: 0.0),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Palindrome",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          isPalindrome();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 13,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          primary: const Color(0xFF2B637B),
                          onPrimary: Colors.white,
                        ),
                        child: const Text(
                          "CHECK",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 13,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          primary: const Color(0xFF2B637B),
                          onPrimary: Colors.white,
                        ),
                        child: const Text(
                          "NEXT",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
