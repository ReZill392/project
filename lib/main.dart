import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/provider/remove_action.dart';
import 'package:project/provider/transaction_provider.dart';
import 'package:project/screens/from_screen.dart';
import 'package:provider/provider.dart';
import 'settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  @override
  void initState(){
    super.initState();
    Provider.of<TransactionProvider>(context,listen: false).initData();
  }

  int _selectedIndex = 0; 

  
  final List<Widget> _pages = [
    TransactionListPage(), 
    AllAnime(),            
    SettingsScreen(toggleTheme: (bool ) {  },), 
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Your Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'All Anime',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped, 
      ),
    );
  }
}

class TransactionListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionProvider>(
      builder: (context, provider, Widget? child) {
        return ListView.builder(
          itemCount: provider.transactions.length,
          itemBuilder: (context, index) {
            String formattedDate = DateFormat('dd/MM/yyyy H:mm:ss').format(provider.transactions[index].date);

            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ListTile(
                title: Text(provider.transactions[index].title),
                subtitle: Text(formattedDate),
                leading: CircleAvatar(
                  radius: 30,
                  child: FittedBox(
                    child: Text('${provider.transactions[index].score}'),
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    removeTransaction(context, index);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class AllAnime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(

    );
  }
}