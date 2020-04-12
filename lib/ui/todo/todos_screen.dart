import 'package:flutter/material.dart';
import 'package:noteapp/constants/app_strings.dart';
import 'package:noteapp/models/todo_model.dart';
import 'package:noteapp/models/user_model.dart';
import 'package:noteapp/providers/auth_provider.dart';
import 'package:noteapp/providers/cart_provider.dart';
import 'package:noteapp/routes.dart';
import 'package:noteapp/services/firestore_database.dart';
import 'package:noteapp/ui/todo/empty_content.dart';
import 'package:noteapp/ui/todo/todos_extra_actions.dart';
import 'package:provider/provider.dart';

class TodosScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final firestoreDatabase =
        Provider.of<FirestoreDatabase>(context, listen: false);
    final check = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: StreamBuilder(
          stream: authProvider.user,
          builder: (context, snapshot) {
            final UserModel user = snapshot.data;
            return Text(
              user != null
                  ? "Welcome, " + user.displayName
                  : AppStrings.homeAppBarTitle,
            );
          },
        ),
        actions: <Widget>[
          StreamBuilder(
            stream: firestoreDatabase.todosStream(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<TodoModel> todos = snapshot.data;
                return Visibility(
                  visible: todos.isNotEmpty ? true : false,
                  child: TodosExtraActions(),
                );
              } else {
                return Container(
                  width: 0,
                  height: 0,
                );
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.setting);
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 3),
            child: Stack(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () =>
                      Navigator.of(context).pushNamed(Routes.add_to_cart),
                ),
                // =============================================================
                Consumer<CartProvider>(
                  builder: (context, cartNotif, _) => Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 14,
                        minHeight: 14,
                      ),
                      child: Text(
                        cartNotif.total.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(
            Routes.create_edit_todo,
          );
        },
      ),
      body: WillPopScope(
        onWillPop: () async => true,
        child: _buildBodySection(context),
      ),
    );
  }

  Widget _buildBodySection(BuildContext context) {
    final firestoreDatabase =
        Provider.of<FirestoreDatabase>(context, listen: false);

    var cart = Provider.of<CartProvider>(context, listen: false);

    return StreamBuilder(
      stream: firestoreDatabase.todosStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<TodoModel> todos = snapshot.data;
          if (todos.isNotEmpty) {
            return ListView.separated(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: Container(
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        AppStrings.todosDismissibleMsgTxt,
                        style: TextStyle(color: Theme.of(context).canvasColor),
                      ),
                    ),
                  ),
                  key: Key(todos[index].id),
                  onDismissed: (direction) {
                    firestoreDatabase.deleteTodo(todos[index]);

                    _scaffoldKey.currentState.showSnackBar(
                      SnackBar(
                        backgroundColor: Theme.of(context).appBarTheme.color,
                        content: Text(
                          AppStrings.todosSnackBarContent + todos[index].task,
                          style:
                              TextStyle(color: Theme.of(context).canvasColor),
                        ),
                        duration: Duration(seconds: 3),
                        action: SnackBarAction(
                          label: AppStrings.todosSnackBarActionLbl,
                          textColor: Theme.of(context).canvasColor,
                          onPressed: () {
                            firestoreDatabase.setTodo(todos[index]);
                          },
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: Checkbox(
                      value: todos[index].complete,
                      onChanged: (value) {
                        TodoModel todo = TodoModel(
                          id: todos[index].id,
                          task: todos[index].task,
                          extraNote: todos[index].extraNote,
                          complete: value,
                        );
                        firestoreDatabase.setTodo(todo);
                      },
                    ),
                    title: Text(todos[index].task),
                    onTap: () {
                      cart.addProduct(todos[index]);
                      Navigator.of(context).pushNamed(
                        Routes.create_edit_todo,
                        arguments: todos[index],
                      );
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(height: 0.5);
              },
            );
          } else {
            return EmptyContentWidget();
          }
        } else if (snapshot.hasError) {
          return EmptyContentWidget(
            title: AppStrings.todosErrorTopMsgTxt,
            message: AppStrings.todosErrorBottomMsgTxt,
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
