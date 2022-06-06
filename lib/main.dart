import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:listas/services.dart';
import 'package:listas/student.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> list = [
    "brayan 21 604600151",
    "brandon 21 604600150",
    "josue 21 604600151"
  ];

  List<student> students = [
    new student("brayan", "21", "604600151"),
    new student("brandon", "21", "604600150"),
    new student("josue", "21", "604600151")
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lab #3 'Listas'",style: TextStyle(fontSize: 35, color: Colors.white),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text(
                  "Opción a",
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => a()));
                },
              ),
              ElevatedButton(
                child: Text(
                  "Opción b",
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => b(list)));
                },
              ),
              ElevatedButton(
                child: Text(
                  "Opción c",
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => c(students)));
                },
              ),
              ElevatedButton(
                child: Text(
                  "Opción d",
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => d()));
                },
              ),
              ElevatedButton(
                child: Text(
                  "Opción e",
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => e()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget a() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas A",style: TextStyle(fontSize: 35, color: Colors.white),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                  child: Text(
                      "a. Un ejemplo de lista simple con datos estáticos y definidos por el desarrollador",style: TextStyle(fontSize: 20,),)),
              Expanded(
                child: ListView(
                  children: [
                    Card(
                      color: Colors.grey[200],
                        child: ListTile(
                      title: Text("Item 1"),
                    )),
                    Card(
                      color: Colors.grey[200],
                        child: ListTile(
                      title: Text("Item 2"),
                    )),
                    Card(
                      color: Colors.grey[200],
                        child: ListTile(
                      title: Text("Item 3"),
                    )),
                    Card(
                      color: Colors.grey[200],
                        child: ListTile(
                      title: Text("Item 4"),
                    )),
                    Card(
                      color: Colors.grey[200],
                        child: ListTile(
                      title: Text("Item 5"),
                    )),
                  ],
                ),
              ),
              Divider(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget b(List<String> list) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas B",style: TextStyle(fontSize: 35, color: Colors.white),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                  child: Text(
                      "b. Un ejemplo de lista simple con datos dinámicos, estos datos deben estar en una Lista  (List [ ] ) con datos primitivos",style: TextStyle(fontSize: 20,))),
              Expanded(
                child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.grey[200],
                        child: ListTile(
                      title: Text(list[index]),
                    ));
                  },
                ),
              ),
              Divider(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget c(List<student> students) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas C",style: TextStyle(fontSize: 35, color: Colors.white),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                  child: Text(
                      "c. Un ejemplo de lista simple con datos dinámicos, estos datos deben estar en una Lista  (List [ ] ) con Objetos, para este caso: Estudiantes.",style: TextStyle(fontSize: 20,))),
              Expanded(
                child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.grey[200],
                      child: ListTile(
                        title: Text("Name: " +
                            students[index].Name +
                            " ID:" +
                            students[index].id),
                        subtitle: Text(students[index].date),
                      ),
                    );
                  },
                ),
              ),
              Divider(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  studenteService service = studenteService();
  Widget d() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas D',style: TextStyle(fontSize: 35, color: Colors.white),),
      ),
      body: Center(
        child: FutureBuilder<List<student>>(
          future: service.get(),
          builder:
              (BuildContext context, AsyncSnapshot<List<student>> snapshot) {
            if (snapshot.hasError) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    )
                  ]);
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        child: CircularProgressIndicator(),
                        width: 60,
                        height: 60,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Awaiting result...'),
                      )
                    ]);
              default:
                final studentss = snapshot.data;
                return ListView.builder(
                  itemCount: studentss.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.grey[200],
                      child: ListTile(
                        title: Text("Name: " +
                            studentss[index].Name +
                            " ID:" +
                            studentss[index].id),
                        subtitle: Text(studentss[index].date),
                      ),
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }

  Widget e() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas D'),
      ),
      body: Center(
        child: FutureBuilder<List<student>>(
          future: service.get(),
          builder:
              (BuildContext context, AsyncSnapshot<List<student>> snapshot) {
            if (snapshot.hasError) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    )
                  ]);
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        child: CircularProgressIndicator(),
                        width: 60,
                        height: 60,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Awaiting result...'),
                      )
                    ]);
              default:
                final studentss = snapshot.data;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: studentss.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.grey[200],
                      child: ListTile(
                        title: Text("Name: " +
                            studentss[index].Name +
                            " ID:" +
                            studentss[index].id),
                        subtitle: Text(studentss[index].date),
                      ),
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
