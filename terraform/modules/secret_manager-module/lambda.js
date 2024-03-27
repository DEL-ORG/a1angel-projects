const AWS = require('aws-sdk');

exports.handler = async (event, context) => {
    // Create a Secrets Manager client
    const secretsManager = new AWS.SecretsManager();

    try {
        // Retrieve the secret value
        const data = await secretsManager.getSecretValue({ SecretId: 'YOUR_SECRET_ID' }).promise();
        
        // Parse and return the secret value
        const secret = JSON.parse(data.SecretString);
        return secret;
    } catch (err) {
        console.error('Error retrieving secret:', err);
        throw err;
    }
};