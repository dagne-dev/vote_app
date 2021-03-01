module.exports = app => {
    const parties = require("../controllers/party.controller.js");

    var router = require("express").Router();

    // Create a new Party
    router.post("/", parties.create);

    // Retrieve all Partys
    router.get("/", parties.findAll);

    // Retrieve a single Party with id
    router.get("/:id", parties.findOne);

    // Update a Party with id
    router.put("/:id", parties.update);

    // Delete a Party with id
    router.delete("/:id", parties.delete);

    // Create a new Party
    router.delete("/", parties.deleteAll);

    app.use("/api/parties", router);
};