var db = connect('mongodb://root:root123@localhost:27017/admin');

var dbs = ['db1', 'db2'];

dbs.forEach((dbname) => {
  db = db.getSiblingDB(dbname); // we can not use "use" statement here to switch db

  db.createUser({
    user: 'app_user',
    pwd: '8fd1401ea33f78baa9b5f5525938eef3226c94d3',
    roles: [{ role: 'readWrite', db: dbname }],
    passwordDigestor: 'server',
  });
});
