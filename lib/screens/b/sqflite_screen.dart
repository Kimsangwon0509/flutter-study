import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteScreen extends StatefulWidget {
  @override
  _SqfliteScreenState createState() => _SqfliteScreenState();
}

class _SqfliteScreenState extends State<SqfliteScreen> {
  /*  Member(String no, String id, String name) */
  Database _db;
  _RawQuery _rawQuery;
  String _memberData = '초기값';
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initQuery();
  }

  @override
  void dispose() {
    super.dispose();
    _db.close();
  }

  void initQuery() async {
    _db = await _DB.getConnection();
    _rawQuery = _RawQuery(database: _db);
  }

  void _showMemberData() async {
    List<Map> _result = await _rawQuery._select();
    setState(() {
      _memberData = _result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DB 테스트'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 50),
            memberForm(),
            SizedBox(height: 30),
            rawQueryButtons(),
            Divider(),
            Container(
              alignment: Alignment.center,
              child: Text('--> member data: $_memberData'),
            ),
          ],
        ),
      ),
    );
  }

  Widget memberForm() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: idController,
              decoration: InputDecoration(
                icon: Icon(Icons.alternate_email),
                hintText: 'someone@email.com',
                labelText: 'Id *',
              ),
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                icon: Icon(Icons.person_outline),
                hintText: 'What do people call you?',
                labelText: 'Name',
              ),
            )
          ],
        ),
      );

  Widget rawQueryButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _flatButton(title: 'select', function: _showMemberData),
          _flatButton(title: 'insert', function: _rawQuery?._insert),
          _flatButton(title: 'update', function: _rawQuery?._update),
          _flatButton(title: 'delete', function: _rawQuery?._delete),
        ],
      );

  Widget _flatButton({@required String title, @required Function function}) =>
      FlatButton(
        color: Colors.cyan[300],
        onPressed: () => function(),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
}

class _DB {
  static Future<Database> getConnection() async {
    Database _database;
    _database = await _open();
    print('>>> ' + _database.toString());

    return _database;
  }

  // ## open a connection to the database
  static Future<Database> _open() async {
    debugPrint('--> open database');
    //  1. database file path 설정 -> path: join(), sqlflite: getDatabasesPath()
    String path = join(await getDatabasesPath(), 'demo.db');
    //  2. database open -> sqlflite: openDatabase()
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        print('---> # onCreate database');
        return db.execute(
          '''create table member(
                no integer primary key autoincrement
                ,id text not null unique
                ,name text
            )''',
        );
      },
    );
  }
}

class _RawQuery {
  Database database;
  _RawQuery({@required this.database});

  ///   execute: Execute an SQL query with "no return value"
  ///   rawInsert: Returns the "last inserted record id"
  void _insert({String id, String name}) async {
    int _no = await database.rawInsert(
      'insert into member(no, id, name) values(null, ?, ?)',
      [id, name],
    );
    debugPrint('rawInsert no: $_no');
  }

  Future<List<Map>> _select() async {
    List<Map> _result = await database.rawQuery(
      'select * from member',
    );
    debugPrint('select rawQuery result: $_result');
    return _result;
  }

  void _update() async {
    int _count = await database.rawUpdate(
      'update member set id = ?, name = ? where id = ?',
      ['첫번째 멤버', '첫번째 업데이트', '첫번째'],
    );
    debugPrint('rawUpdate count: $_count');
  }

  void _delete() async {
    int _count = await database.rawDelete(
      'delete from member where id = ?',
      ['raw2'],
    );
    debugPrint('rawDelete count: $_count');
  }
}
