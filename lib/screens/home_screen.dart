import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/models/transactions.dart';
import 'package:project/provider/transaction_provider.dart';
import 'package:project/screens/datail_screen.dart';
import 'package:project/screens/from_screen.dart';
import 'package:provider/provider.dart';
import 'settings_screen.dart';
import 'package:project/screens/edit_dialog.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
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
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Anime'),
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
            var statement = provider.transactions[index];
            String formattedDate = DateFormat('dd/MM/yyyy H:mm:ss').format(provider.transactions[index].date);
            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ListTile(
                title: Text(statement.title),
                subtitle: Text(formattedDate),
                leading: CircleAvatar(
                  radius: 30,
                  child: FittedBox(
                    child: Text('${statement.score}'),
                  ),
                ),
                 onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransactionDetailPage(
                        transaction: statement,
                      ),
                    ),
                  );
                },
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        showEditDialog(
                          context,
                          statement,
                          (Transactions updatedTransaction) {
                            provider.updateTransaction(index, updatedTransaction);
                          },
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        provider.deleteTransaction(index);
                      },
                    ),
                  ],
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