import 'package:flutter/material.dart';
import 'package:pip_view/pip_view.dart';

class PIPViewPage extends StatefulWidget {
  const PIPViewPage({super.key});

  @override
  State<PIPViewPage> createState() => _PIPViewPageState();
}

class _PIPViewPageState extends State<PIPViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "PIP View ",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PIPView(builder: (context, isFloating) {
      return Scaffold(
          resizeToAvoidBottomInset: isFloating,
          body: SafeArea(
              child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            const Center(
                              child: Text(
                                "This is Window",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            MaterialButton(
                              onPressed: () {
                                PIPView.of(context)
                                    ?.presentBelow(const BackgroundScreen());
                              },
                              color: Theme.of(context).primaryColor,
                              child: const Text(
                                "Start floating",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ])))));
    });
  }
}

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 209, 202, 221),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Text(
              "This is the background page!",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
