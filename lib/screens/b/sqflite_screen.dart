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
  Database db;
  String memberData = '초기값';

  @override
  void initState() {
    _DB.open().then((database) => {db = database});
  }

  @override
  void dispose() {
    db.close();
  }

  void _setMemberDataToRawResult() async {
    List<Map> _result = await _selectRawQuery();
    setState(() {
      memberData = _result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DB 테스트'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MemberInfoForm(),
            SizedBox(height: 30),
            _flatButton(title: 'excute insert', function: _executeInsert),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _flatButton(
                    title: 'select', function: _setMemberDataToRawResult),
                _flatButton(title: 'insert', function: _rawInsert),
                _flatButton(title: 'update', function: _rawUpdate),
                _flatButton(title: 'delete', function: _rawDelete),
              ],
            ),
            Divider(),
            Text('--> member data: $memberData'),
          ],
        ),
      ),
    );
  }

  ///   execute: Execute an SQL query with "no return value"
  ///   rawInsert: Returns the "last inserted record id"
  void _executeInsert() {
    db.execute(
      'insert into member(id, name) values(?, ?)',
      ['excute', 'insert Excute'],
    );
  }

  /*       --- Raw SQL queries ---       */
  void _rawInsert() async {
    int _no = await db.rawInsert(
      'insert into member(no, id, name) values(null, ?, ?)',
      ['raw3', 'rawInsert'],
    );
    debugPrint('rawInsert no: $_no');
  }

  Future<List<Map>> _selectRawQuery() async {
    List<Map> _result = await db.rawQuery('select * from member');
    debugPrint('select rawQuery result: $_result');
    return _result;
  }

  void _rawUpdate() async {
    int _count = await db.rawUpdate(
      'update member set id = ?, name = ? where id = ?',
      ['첫번째 멤버', '첫번째 업데이트', '첫번째'],
    );
    debugPrint('rawUpdate count: $_count');
  }

  void _rawDelete() async {
    int _count = await db.rawDelete(
      'delete from member where id = ?',
      ['raw2'],
    );
    debugPrint('rawDelete count: $_count');
  }

  /*        --- Other ---       */
  void _transaction() async {}

  Widget _flatButton({@required String title, @required Function function}) =>
      FlatButton(
        color: Colors.cyan,
        onPressed: () => function(),
        child: Text(title),
      );
}

class MemberInfoForm extends StatefulWidget {
  @override
  _MemberInfoFormState createState() => _MemberInfoFormState();
}

class _MemberInfoFormState extends State<MemberInfoForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'What do people call you?',
        labelText: 'Name *',
      ),
      onSaved: (String value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
      },
    );
  }
}

class _DB {
  // ## open a connection to the database
  static Future<Database> open() async {
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
          'create table member(no integer primary key autoincrement, id text not null unique, name text)',
        );
      },
    );
  }
}
