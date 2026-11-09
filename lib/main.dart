
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// MAIN APPLICATION
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Advanced Mobile Programming Labs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// HOME PAGE
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Practical Labs'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.flutter_dash,
                size: 90,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              const Text(
                'Advanced Mobile Programming',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              labButton(
                context,
                'Lab 1 - Environment Setup',
                const Lab1Page(),
              ),

              labButton(
                context,
                'Lab 2 - Widget Tree',
                const Lab2Page(),
              ),

              labButton(
                context,
                'Lab 3 - Lifecycle',
                const Lab3Page(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget labButton(
    BuildContext context,
    String title,
    Widget page,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: 300,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => page,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(title),
          ),
        ),
      ),
    );
  }
}

// =====================================
// PRACTICAL LAB 1 - ENVIRONMENT SETUP
// =====================================

class Lab1Page extends StatelessWidget {
  const Lab1Page({super.key});

  @override
  Widget build(BuildContext context) {
    const commands = [
      'flutter --version',
      'flutter doctor',
      'flutter doctor -v',
      'flutter doctor --android-licenses',
      'flutter emulators',
      'flutter devices',
      'flutter run',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 1 - Environment'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Flutter Environment Setup',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            '1. Install Flutter SDK.\n'
            '2. Add Flutter bin directory to PATH.\n'
            '3. Install Android Studio and Android SDK.\n'
            '4. Accept Android licenses.\n'
            '5. Start emulator or connect phone.\n'
            '6. Run the following commands in terminal.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Text(
            'Terminal Commands:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ...commands.map(
            (command) => Card(
              child: ListTile(
                leading: const Icon(
                  Icons.terminal,
                  color: Colors.blue,
                ),
                title: SelectableText(command),
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Note: These commands must be executed '
            'in VS Code terminal or PowerShell. '
            'This screen only displays the instructions.',
          ),
        ],
      ),
    );
  }
}

// =====================================
// PRACTICAL LAB 2 - WIDGET TREE
// =====================================

class Lab2Page extends StatelessWidget {
  const Lab2Page({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Lab 2: StatelessWidget build()');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 2 - Widget Tree'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hello Flutter!',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Widget Tree Structure',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              widgetNode('MaterialApp'),
              const Icon(Icons.arrow_downward),
              widgetNode('Scaffold'),
              const Icon(Icons.arrow_downward),
              widgetNode('Center'),
              const Icon(Icons.arrow_downward),
              widgetNode('Text'),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Parent: Center\n'
                  'Child: Text\n\n'
                  'StatelessWidget has no mutable '
                  'State object.\n\n'
                  'Widgets are immutable configurations.\n\n'
                  'An Element represents a mounted '
                  'widget location in the UI tree.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget widgetNode(String name) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue),
      ),
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// =====================================
// PRACTICAL LAB 3 - LIFECYCLE
// =====================================

class Lab3Page extends StatefulWidget {
  const Lab3Page({super.key});

  @override
  State<Lab3Page> createState() => _Lab3PageState();
}

class _Lab3PageState extends State<Lab3Page> {
  bool showWidget = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 3 - Lifecycle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showWidget)
              const LifecycleCounter()
            else
              const Text(
                'Widget Removed!',
                style: TextStyle(fontSize: 25),
              ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showWidget = !showWidget;
                });
              },
              child: Text(
                showWidget
                    ? 'Remove Widget'
                    : 'Show Widget',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// STATEFUL WIDGET FOR LIFECYCLE TESTING
class LifecycleCounter extends StatefulWidget {
  const LifecycleCounter({super.key});

  @override
  State<LifecycleCounter> createState() =>
      _LifecycleCounterState();
}

class _LifecycleCounterState
    extends State<LifecycleCounter> {
  int counter = 0;
  int buildCount = 0;

  @override
  void initState() {
    super.initState();
    debugPrint('LIFECYCLE: initState() called');
  }

  @override
  Widget build(BuildContext context) {
    buildCount++;

    debugPrint(
      'LIFECYCLE: build() called $buildCount times',
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'StatefulWidget Lifecycle',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Counter: $counter',
          style: const TextStyle(fontSize: 30),
        ),
        const SizedBox(height: 10),
        Text(
          'Build Count: $buildCount',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              counter++;
            });

            debugPrint(
              'LIFECYCLE: setState() called '
              'Counter = $counter',
            );
          },
          child: const Text('Increase Counter'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    debugPrint('LIFECYCLE: dispose() called');
    super.dispose();
  }
}
