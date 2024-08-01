2-terraform is structured based on terragrunt standards that enforces dependency and readability for the users, there are two main folders here test_configs and modules.
The modules are separated into two folders, network and infra.

 To run the infrastructure code: 
- make sure to have terragrunt installed on your device for better management (you can still run using terraform, skip to line 20)
- you can run the script set_aws_permissions.sh if your aws config is not set to run on an account yet.
- go to the test_configs/demo folder.
- run terrgrunt plan-all to validate both network and infra changes, you can also go to the specific folder and run terragrunt plan to validate folder specific changes.
- run terragrunt run-all to apply all changes for both network and infra changes.

if successful, the stage 1-network should deploy the VPC, Subnet and Security group.
2-infra should provision the EC2 instance with subnet and volume attachments