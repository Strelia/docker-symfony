Need add symfony folder

Config for symfony mongo

server: 'mongodb://%env(resolve:MONGODB_USERNAME)%:%env(resolve:MONGODB_PASSWORD)%@%env(resolve:MONGODB_URL)%/%env(resolve:MONGODB_DB)%'
