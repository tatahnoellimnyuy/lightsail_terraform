# lightsail_terraform

##
# **Terraform AWS Lightsail Instance Configuration**

This Terraform code provisions an AWS Lightsail instance, a static public IP address, and a key pair.

## **Requirements**

- AWS Account
- Terraform

## **Usage**

1. Clone the repository
2. Update the region variable in the provider block if needed
3. Update the name, blueprint\_id, bundle\_id, and availability\_zone variables in the aws\_lightsail\_instance block
4. Run terraform init to initialize the working directory
5. Run terraform apply to create the Lightsail instance, key pair, and static IP address.

After Terraform has successfully run, you can find the SSH key pair in the myKey.pem file in the current directory.

## **Resources Created**

- tls\_private\_key - A RSA private key
- aws\_lightsail\_key\_pair - An AWS Lightsail key pair using the RSA private key
- local\_file - A local file that stores the RSA private key
- aws\_lightsail\_instance - An AWS Lightsail instance
- aws\_lightsail\_static\_ip - A static public IP address on Lightsail
- aws\_lightsail\_static\_ip\_attachment - Attaches the static IP address to the Lightsail instance.

## **License**

This project is licensed under the MIT License - see the[LICENSE.md](https://chat.openai.com/chat/LICENSE.md) file for details.