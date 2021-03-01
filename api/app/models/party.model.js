module.exports = mongoose => {
    var schema = mongoose.Schema({
        name: String,
        leader: String,
        description: String,
        vote: Number,
    }, { timestamps: true });

    schema.method("toJSON", function() {
        const { __v, id, ...object } = this.toObject();
        object.id = id;
        return object;
    });

    const Party = mongoose.model("party", schema);
    return Party;
};