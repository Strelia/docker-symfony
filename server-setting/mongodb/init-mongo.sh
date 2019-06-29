#!/usr/bin/env bash

mongo <<EOF
let root = '$MONGO_INITDB_ROOT_USERNAME';
let rootPass = '$MONGO_INITDB_ROOT_PASSWORD';
let user = '$MONGODB_USERNAME';
let userPass = '$MONGODB_PASSWORD';
let dataBase = '$MONGODB_DB';


console.log('_______________________________________________');
console.log(process.env);
console.log('_______________________________________________');

db = db.getSiblingDB('admin');

db.createUser(
    {
        user: root,
        pwd: rootPass,
        roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
    }
);

db.auth(root, rootPass);

db = db.getSiblingDB(dataBase);

db.createUser({
    user: user,
    pwd: userPass,
    roles: [
        {
            role: 'root',
            db: 'admin',
        },
    ],
});
EOF