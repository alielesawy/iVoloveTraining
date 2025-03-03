# Create S3 Bucket Lab
![S3 Icon](/src/SimpleStorageService.svg)

This lab covers how to create and configure an Amazon S3 bucket, including versioning and logging.

---

## Step 1: Create an S3 Bucket
```bash
aws s3api create-bucket --bucket ivolve-s3-poipoiuop --region us-east-1
```

## Step 2: Configure Bucket Permissions
```bash
aws s3api put-public-access-block --bucket ivolve-s3-poipoiuop --public-access-block-configuration \
  BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true
```

## Step 3: Enable Versioning
```bash
aws s3api put-bucket-versioning --bucket ivolve-s3-poipoiuop --versioning-configuration Status=Enabled
```

## Step 4: Enable Logging
1. **Create a Logging Bucket**  
   ```bash
   aws s3api create-bucket --bucket ivolve-s3-poipoiuop-logs --region us-east-1
   ```
2. **Enable Logging for the Main Bucket**  
   ```bash
   aws s3api put-bucket-logging --bucket ivolve-s3-poipoiuop --bucket-logging-status '{
     "LoggingEnabled": {
       "TargetBucket": "ivolve-s3-poipoiuop-logs",
       "TargetPrefix": "logs/"
     }
   }'
   ```

## Step 5: Upload a File to S3
```bash
aws s3 cp test.txt s3://ivolve-s3-poipoiuop/test.txt
```

## Step 6: Download a File from S3
```bash
aws s3 cp s3://ivolve-s3-poipoiuop/test.yaml yaml_downloaded.txt
```

## Step 7: Verify Versioning
1. **Update and Upload a New Version**  
   ```bash
   echo "New Version" > test.txt
   aws s3 cp test.txt s3://ivolve-s3-poipoiuop/test.txt
   ```
2. **List Object Versions**  
   ```bash
   aws s3api list-object-versions --bucket ivolve-s3-poipoiuop
   ```
## Demo
- CLI Screen Shots
![cli](/src/s3-cli.png)

