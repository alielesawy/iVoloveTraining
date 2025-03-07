
# Serverless HTTP API with DynamoDB

## Overview
1. **DynamoDB Table**  
   Create a table to store your data, choosing a partition key ```id``` and table name ```ivolve-table```.
    - Table 
    ![table](/src/dynamo-table.png)
2. **Lambda Function**  
   Write a Lambda function in your preferred language (e.g., Python, Node.js) that interacts with the DynamoDB table here is with ```Node.Js```: [Function](/Amazon%20Web%20Services%20(AWS)/Day6/serverless-app/function.js)
    - Function 
    ![function](/src/function.png)
    - Test The Function
       * GET ![get](/src/get-test.png)
       * PUT ![put](/src/put-test.png)
3. **IAM Permissions**  
   Configure an IAM role that allows Lambda to read and write to your DynamoDB table.

4. **HTTP API**  
   Create an HTTP API in API Gateway and integrate it with your Lambda function by setting up routes and methods (e.g., GET, POST).
    - API
    ![api](/src/api-gateway.png)
    - Integration
    ![in](/src/api-integration.png)
5. **Test Your API**  
   - Deploy the API.  
   - Invoke the endpoint using a tool like cURL or Postman to verify results from DynamoDB.
4. **DEMO**
    - API URL at broweser getting all items 
    ![br](/src/browser-get-all.png)
    - using curl
        * PUT 
        ![p](/src/cli-put.png)
        * GET all 
        ![g](/src/cli-get-all.png)
        * GET an item
        ![g](/src/cli-get-an-item.png)
        * DELETE
        ![d](/src/cli-delete.png)
## References
- [AWS Docs: HTTP API with DynamoDB](https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-dynamo-db.html)

## Next Step
Creating static website hosted on S3 bucket and perform the *CRUD* operation though it