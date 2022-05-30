module.exports = {
    handler: (event, context, callback) => {
        console.log({ event, context });
        if (callback) {
            callback(null, {
                statusCode: 200,
                body: "Hello,Lambda!",
            });
        } else {
            return "hoge";
        }
    },
};
