const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
//added for auth
const dbConfig = require("./app/config/db.config");
//

const app = express();

var corsOptions = {
    origin: "http://localhost:8081"
};

app.use(cors(corsOptions));

// parse requests of content-type - application/json
app.use(bodyParser.json());

// parse requests of content-type - application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }));

const db = require("./app/models");
//added for auth
const Role = db.role;
//
db.mongoose
    //.connect(db.url, {
    //added for auth
    .connect(`mongodb://${dbConfig.HOST}:${dbConfig.PORT}/${dbConfig.DB}`, {
        //
        useNewUrlParser: true,
        useUnifiedTopology: true
    })
    .then(() => {
        //console.log("Connected to the database!");
        //added for auth
        console.log("Successfully connect to MongoDB.");
        initial();
        //
    })
    .catch(err => {
        //console.log("Cannot connect to the database!", err);
        //process.exit();
        //added for auth
        console.error("Connection error", err);
        process.exit();
        //
    });

// simple route
app.get("/", (req, res) => {
    res.json({ message: "Welcome to vote application." });
});
//added for auth
// routes
require("./app/routes/auth.routes")(app);
require("./app/routes/user.routes")(app);
//
require("./app/routes/party.routes")(app);

// set port, listen for requests
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}.`);
});
//added for auth
function initial() {
    Role.estimatedDocumentCount((err, count) => {
        if (!err && count === 0) {
            new Role({
                name: "user"
            }).save(err => {
                if (err) {
                    console.log("error", err);
                }

                console.log("added 'user' to roles collection");
            });

            // new Role({
            //     name: "moderator"
            // }).save(err => {
            //     if (err) {
            //         console.log("error", err);
            //     }

            //     console.log("added 'moderator' to roles collection");
            // });

            new Role({
                name: "admin"
            }).save(err => {
                if (err) {
                    console.log("error", err);
                }

                console.log("added 'admin' to roles collection");
            });
        }
    });
}
//