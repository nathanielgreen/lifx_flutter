import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static const bool ENABLE_STORYBOOK = const bool.fromEnvironment("ENABLE_STORYBOOK", defaultValue: false)

  @override
  Widget build(BuildContext context) {
    return 
        ? Storybook(
            storyWrapperBuilder: (context, story, child) => Stack(
                  children: [
                    Container(
                      padding: story.padding,
                      color: Theme.of(context).canvasColor,
                      child: Center(child: child),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          story.name,
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ],
                ),
            children: [
                Story(
                  section: 'Buttons',
                  name: 'Flat button',
                  builder: (_, k) => MaterialButton(
                    onPressed: k.boolean(label: 'Enabled', initial: true)
                        ? () {}
                        : null,
                    child: Text(k.text(label: 'Text', initial: 'Flat button')),
                  ),
                ),
              ])
        : MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.grey,
            ),
            home: MyHomePage(title: 'Flutter Demo Home Page'),
          );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'Hello',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('clicked'),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
