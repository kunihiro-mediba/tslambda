import type { Context, APIGatewayEvent, APIGatewayProxyCallback } from "aws-lambda";
import { graphql, buildSchema } from "graphql";

const schema = buildSchema(`
    type Query {
        hello: String!
    }
`);

const rootValue = {
    hello() {
        return "Hello,World!";
    },
};

export async function handler(
    event: APIGatewayEvent,
    _context: Context,
    callback?: APIGatewayProxyCallback,
): Promise<void | string> {
    const { query, variables } = JSON.parse(event.body);
    const result = await graphql({
        schema,
        rootValue,
        source: query,
        variableValues: variables,
    });
    if (callback) {
        callback(null, {
            statusCode: 200,
            headers: {
                "Content-Type": "application/json;charset=UTF-8",
            },
            body: JSON.stringify(result),
        });
        return;
    }
    return JSON.stringify(result);
}
