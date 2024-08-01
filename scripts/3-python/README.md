ensure that the aws credentials is initialized before running the python script

install the requirements.txt using pip install -r requirements.txt

run python check_reboot_ec2.py --instanceID ["I-123456789"] --SNSTopic "arn:aws:sns:us-west-2:123456789999:Devops-Alerts"

arguments instanceID and SNSTopic is required
