import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Web',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        '/tournament': (context) => TournamentPage(),
        '/category': (context) => CategoryPage(),
        '/selectPlayer': (context) => SelectPlayerPage(),
        '/confirmRegistration': (context) => ConfirmRegistrationPage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 12.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
              },
            ),
            TextButton(
              child: Text('Criar conta'),
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            SizedBox(height: 12.0),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 12.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              child: Text('Registrar'),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Página Inicial')),
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Inscrever em torneio'),
              onPressed: () {
                Navigator.pushNamed(context, '/selectPlayer');
              },
            ),
            ElevatedButton(
              child: Text('Consultar torneios'),
              onPressed: () {
                Navigator.pushNamed(context, '/tournament');
              },
            ),
            ElevatedButton(
              child: Text('Consultar Categorias de torneios'),
              onPressed: () {
                Navigator.pushNamed(context, '/category');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TournamentPage extends StatefulWidget {
  @override
  _TournamentPageState createState() => _TournamentPageState();
}

class _TournamentPageState extends State<TournamentPage> {

  @override
  Widget build(BuildContext context) {
    var selectedTournament;
    return Scaffold(
      appBar: AppBar(title: Text('Consultar Torneios')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Selecione um torneio:'),
            SizedBox(height: 12.0),
            DropdownButton<String>(
              value: selectedTournament,
              hint: Text('Selecione um torneio'),
              onChanged: (value) {
                setState(() {
                  selectedTournament = value;
                });
              },
              items: <String>[
                'Futbola',
                'Tacoball',
                'Basqueteiros',
                'Futmão',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  Widget build(BuildContext context) {
    var selectedCategory;
    return Scaffold(
      appBar: AppBar(title: Text('Consultar Categorias de Torneios')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Selecione uma categoria:'),
            SizedBox(height: 12.0),
            DropdownButton<String>(
              value: selectedCategory,
              hint: Text('Selecione uma categoria'),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
              items: <String>[
                'Futebol',
                'Beisebol',
                'Basquete',
                'Handebol',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectPlayerPage extends StatefulWidget {
  @override
  _SelectPlayerPageState createState() => _SelectPlayerPageState();
}

class _SelectPlayerPageState extends State<SelectPlayerPage> {

  @override
  Widget build(BuildContext context) {
    var selectedPlayer;
    var selectedTournament;
    return Scaffold(
      appBar: AppBar(title: Text('Selecionar Jogador')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Selecione um jogador para formar uma dupla:'),
            SizedBox(height: 12.0),
            DropdownButton<String>(
              value: selectedPlayer,
              hint: Text('Selecione um jogador'),
              onChanged: (value) {
                setState(() {
                  selectedPlayer = value;
                });
              },
              items: <String>[
                'Zé Carlos',
                'Tonhão',
                'Bebeto',
                'Carleto',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 12.0),
            Text('Selecione um torneio para fazer dupla:'),
            SizedBox(height: 12.0),
            DropdownButton<String>(
              value: selectedTournament,
              hint: Text('Selecione um torneio'),
              onChanged: (value) {
                setState(() {
                  selectedTournament = value;
                });
              },
              items: <String>[
                'Futbola - Futebol',
                'Tacoball - Beisebol',
                'Basqueteiros - Basquete',
                'Futmão - Handebol',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              child: Text('Confirmar'),
              onPressed: () {
                Navigator.pushNamed(context, '/confirmRegistration');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmRegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Confirmar Inscrição')),
      body: Center(
        child: ElevatedButton(
          child: Text('Confirmar Inscrição'),
          onPressed: () {
          },
        ),
      ),
    );
  }
}