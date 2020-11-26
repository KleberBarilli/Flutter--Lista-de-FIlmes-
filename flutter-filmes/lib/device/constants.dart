const String usuarioTable = '''
  CREATE TABLE IF NOT EXISTS session (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    email TEXT
  );
''';

const String movieTable = '''
  CREATE TABLE IF NOT EXISTS movie (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    name TEXT,
    year TEXT,
    image TEXT,
    genre TEXT
  );
''';

