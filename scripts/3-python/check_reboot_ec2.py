import argparse
import boto3

from botocore.exceptions import NoCredentialsError, PartialCredentialsError
from datetime import datetime

sns_client = boto3.client('sns', region_name='us-west-2')

def is_odd(number):
    return number % 2 != 0

def reboot_instances(args):
    ec2_client = boto3.client('ec2')
    now        = datetime.now()

    day_of_month = now.day
    instance_ids = args.instanceID
    topic_arn    = args.SNSTopic
    
    # Check if day of month is odd before rebooting
    if is_odd(day_of_month):
        try:
            response = ec2_client.reboot_instances(InstanceIds=instance_ids)
            print(f"Rebooting instances : {', '.join(instance_ids)}")
            publish_to_sns(topic_arn, f"instance {instance_ids} is being rebooted", "Devops-Alerts")
        except Exception as e:
            print(f"Error rebooting instances: {', '.join(instance_ids)}: {str(e)}")
    else: 
        print(f"Current day of month ({day_of_month}) is not an odd number, skipping reboot...")

def publish_to_sns(topic_arn, message, subject=None):
    try:
        # Publish the message
        response = sns_client.publish(
            TopicArn=topic_arn,
            Message=message,
            Subject=subject
        )
        return response
    except (NoCredentialsError, PartialCredentialsError) as e:
        print("Error: AWS credentials not found or incomplete.")
        print(e)
    except Exception as e:
        print("Error: An error occurred while publishing the message.")
        print(e)

if __name__ == "__main__":
    # replace instance ID and topic ARN here to test
    parser = argparse.ArgumentParser(description="A script that accepts command-line arguments.")

    # Add arguments
    parser.add_argument('--instanceID', type=str, required=False, help="Instance ID to reboot", default=["i-123456789"])
    parser.add_argument('--SNSTopic', type=str, required=True, help="SNS Topic")
    args = parser.parse_args()

    reboot_instances(args)
