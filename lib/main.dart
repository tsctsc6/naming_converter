import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Naming Converter',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Naming Converter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _inputController = TextEditingController();
  String firstLetterUppercaseCamel = '';
  String firstLetterLowercaseCamel = '';
  String allLettersUppercaseCamel = '';
  String allLettersLowercaseCamel = '';
  String firstLetterUppercaseSnake = '';
  String firstLetterLowercaseSnake = '';
  String allLettersUppercaseSnake = '';
  String allLettersLowercaseSnake = '';
  String firstLetterUppercaseKebab = '';
  String firstLetterLowercaseKebab = '';
  String allLettersUppercaseKebab = '';
  String allLettersLowercaseKebab = '';
  String firstLetterUppercaseSpace = '';
  String firstLetterLowercaseSpace = '';
  String allLettersUppercaseSpace = '';
  String allLettersLowercaseSpace = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Center(
              child: TextField(
                controller: _inputController,
                showCursor: true,
                onSubmitted: (_) {
                  _onSubmit();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Input',
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: TextButton(
                        onPressed: () => _copy(firstLetterUppercaseCamel),
                        child: Text(firstLetterUppercaseCamel),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: TextButton(
                        onPressed: () => _copy(firstLetterLowercaseCamel),
                        child: Text(firstLetterLowercaseCamel),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: TextButton(
                        onPressed: () => _copy(allLettersUppercaseCamel),
                        child: Text(allLettersUppercaseCamel),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: TextButton(
                        onPressed: () => _copy(allLettersLowercaseCamel),
                        child: Text(allLettersLowercaseCamel),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: TextButton(
                        onPressed: () => _copy(firstLetterUppercaseSnake),
                        child: Text(firstLetterUppercaseSnake),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: TextButton(
                        onPressed: () => _copy(firstLetterLowercaseSnake),
                        child: Text(firstLetterLowercaseSnake),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: TextButton(
                        onPressed: () => _copy(allLettersUppercaseSnake),
                        child: Text(allLettersUppercaseSnake),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: TextButton(
                        onPressed: () => _copy(allLettersLowercaseSnake),
                        child: Text(allLettersLowercaseSnake),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: TextButton(
                        onPressed: () => _copy(firstLetterUppercaseKebab),
                        child: Text(firstLetterUppercaseKebab),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: TextButton(
                        onPressed: () => _copy(firstLetterLowercaseKebab),
                        child: Text(firstLetterLowercaseKebab),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: TextButton(
                        onPressed: () => _copy(allLettersUppercaseKebab),
                        child: Text(allLettersUppercaseKebab),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: TextButton(
                        onPressed: () => _copy(allLettersLowercaseKebab),
                        child: Text(allLettersLowercaseKebab),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: TextButton(
                        onPressed: () => _copy(firstLetterUppercaseSpace),
                        child: Text(firstLetterUppercaseSpace),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: TextButton(
                        onPressed: () => _copy(firstLetterLowercaseSpace),
                        child: Text(firstLetterLowercaseSpace),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: TextButton(
                        onPressed: () => _copy(allLettersUppercaseSpace),
                        child: Text(allLettersUppercaseSpace),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: TextButton(
                        onPressed: () => _copy(allLettersLowercaseSpace),
                        child: Text(allLettersLowercaseSpace),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                'Tip: The tool will automatically filter out non-alphanumeric characters in the original text and convert them to spaces. Click the corresponding button to copy the result.',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSubmit() {
    final words = _inputController.text.split(
      RegExp(r'([^a-zA-Z0-9])|(?<=[a-z0-9])(?=[A-Z])'),
    );
    for (int i = 0; i < words.length; i++) {
      words[i] = words[i].toLowerCase().capitalizeFirstLetter();
    }
    setState(() {
      firstLetterUppercaseCamel = words.join('');
      firstLetterLowercaseCamel =
          '${words[0].toLowerCase()}${words.skip(1).join('')}';
      allLettersUppercaseCamel = words.map((x) => x.toUpperCase()).join('');
      allLettersLowercaseCamel = words.map((x) => x.toLowerCase()).join('');
      firstLetterUppercaseSnake = words.join('_');
      firstLetterLowercaseSnake =
          '${words[0].toLowerCase()}_${words.skip(1).join('_')}';
      allLettersUppercaseSnake = words.map((x) => x.toUpperCase()).join('_');
      allLettersLowercaseSnake = words.map((x) => x.toLowerCase()).join('_');
      firstLetterUppercaseKebab = words.join('-');
      firstLetterLowercaseKebab =
          '${words[0].toLowerCase()}-${words.skip(1).join('-')}';
      allLettersUppercaseKebab = words.map((x) => x.toUpperCase()).join('-');
      allLettersLowercaseKebab = words.map((x) => x.toLowerCase()).join('-');
      firstLetterUppercaseSpace = words.join(' ');
      firstLetterLowercaseSpace =
          '${words[0].toLowerCase()} ${words.skip(1).join(' ')}';
      allLettersUppercaseSpace = words.map((x) => x.toUpperCase()).join(' ');
      allLettersLowercaseSpace = words.map((x) => x.toLowerCase()).join(' ');
    });
  }

  Future<void> _copy(String value) async {
    final messenger = ScaffoldMessenger.of(context);
    await Clipboard.setData(ClipboardData(text: value));
    const snackBar = SnackBar(content: Text('Copied'));
    messenger.clearSnackBars();
    messenger.showSnackBar(snackBar);
  }
}

extension StringExtension on String {
  String capitalizeFirstLetter() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}
