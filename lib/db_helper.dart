import 'notification_id.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

final String tableNotification = 'notifications';
final String columnId = 'id';
final String notificationId = 'noteId';

class DBHelper {
  static Database? _database;
  static DBHelper? _dbHelper;

  DBHelper._createInstance();
  factory DBHelper() {
    if (_dbHelper == null) {
      _dbHelper = DBHelper._createInstance();
    }
    return _dbHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "notification.db";

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          create table $tableNotification ( 
          $columnId integer primary key autoincrement, 
          $notificationId integer not null,
         )
        ''');
      },
    );
    return database;
  }

  void insertNotification(NotificationID noteId) async {
    var db = await this.database;
    var result = await db.insert(tableNotification, noteId.toJson());
    print('result : $result');
  }

  Future<List<NotificationID>> getNotifications() async {
    List<NotificationID> _notifications = [];

    var db = await this.database;
    var result = await db.query(tableNotification);
    result.forEach((element) {
      var notificationId = NotificationID.fromJson(element);
      _notifications.add(notificationId);
    });

    return _notifications;
  }

  Future<int> delete(int? id) async {
    var db = await this.database;
    return await db.delete(tableNotification, where: '$columnId = ?', whereArgs: [id]);
  }
}

//#var notificationID = NotificationID( id = )