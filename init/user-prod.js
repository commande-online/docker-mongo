db.createUser(
    {
        user: "col2-prod",
        pwd: "Kt69e8c3NPSwaxjE7c6959Te99ztNC8w",
        roles: [
            { role: "readWrite", db: "col2-prod" }
        ]
    }
);
db.createUser(
    {
        user: "backup",
        pwd: "JjeGCJZK9eszDNznFzCYyTfFKDb8uFeA",
        roles: [
            { role: "dbAdmin", db: "col2-prod" },
            { role: "readWrite", db: "col2-prod" }
        ]
    }
);
//exit;