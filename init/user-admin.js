db.createUser(
    {
        user: "admin",
        pwd: "7665R734d63w88C385Q2997N5U496htH",
        roles: [
            { role: "readWrite", db: "col2-prod" },
            { role: "userAdminAnyDatabase", db: "admin" }
        ]
    }
);