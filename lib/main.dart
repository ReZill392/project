import 'package:flutter/material.dart';
import 'package:project/provider/transaction_provider.dart';
import 'package:project/screens/from_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider();
        }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Anime 2024'),
      ),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FormScreen();
                }));
              },
            ),
          ],
        ),
        body: Consumer(
          builder: (context, TransactionProvider provider, Widget? child) {
            return ListView.builder(
              itemCount: provider.transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  child: ListTile(
                    title: Text(provider.transactions[index].title),
                    subtitle: Text(provider.transactions[index].date.toString()),
                    leading: CircleAvatar(
                      radius: 30,
                      child: FittedBox(
                        child: Text('${provider.transactions[index].amount}'),
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {},
                    ),
                  ),
                );
              },
            );
          },
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
