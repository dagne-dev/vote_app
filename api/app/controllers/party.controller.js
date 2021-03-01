const db = require("../models");
const Party = db.parties;

// Create and Save a new Party
exports.create = (req, res) => {
    // Validate request
    if (!req.body.name) {
        res.status(400).send({ message: "Content can not be empty!" });
        return;
    }

    // Create a Party
    const party = new Party({
        name: req.body.name,
        leader: req.body.leader,
        description: req.body.description,
        vote: req.body.vote,
    });

    // Save Party in the database
    party
        .save(party)
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while creating the Party."
            });
        });
};

// Retrieve all Partys from the database.
exports.findAll = (req, res) => {
    const name = req.query.name;
    var condition = name ? { name: { $regex: new RegExp(name), $options: "i" } } : {};

    Party.find(condition)
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving parties."
            });
        });
};

// Find a single Party with an id
exports.findOne = (req, res) => {
    const id = req.params.id;

    Party.findById(id)
        .then(data => {
            if (!data)
                res.status(404).send({ message: "Not found Party with id " + id });
            else res.send(data);
        })
        .catch(err => {
            res
                .status(500)
                .send({ message: "Error retrieving Party with id=" + id });
        });
};

// Update a Party by the id in the request
exports.update = (req, res) => {
    if (!req.body) {
        return res.status(400).send({
            message: "Data to update can not be empty!"
        });
    }

    const id = req.params.id;

    Party.findByIdAndUpdate(id, req.body, { useFindAndModify: false })
        .then(data => {
            if (!data) {
                res.status(404).send({
                    message: `Cannot update Party with id=${id}. Maybe Party was not found!`
                });
            } else res.send({ message: "Party was updated successfully." });
        })
        .catch(err => {
            res.status(500).send({
                message: "Error updating Party with id=" + id
            });
        });
};

// Delete a Party with the specified id in the request
exports.delete = (req, res) => {
    const id = req.params.id;

    Party.findByIdAndRemove(id, { useFindAndModify: false })
        .then(data => {
            if (!data) {
                res.status(404).send({
                    message: `Cannot delete Party with id=${id}. Maybe Party was not found!`
                });
            } else {
                res.send({
                    message: "Party was deleted successfully!"
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message: "Could not delete Party with id=" + id
            });
        });
};

// Delete all Partys from the database.
exports.deleteAll = (req, res) => {
    Party.deleteMany({})
        .then(data => {
            res.send({
                message: `${data.deletedCount} Partys were deleted successfully!`
            });
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred while removing all parties."
            });
        });
};