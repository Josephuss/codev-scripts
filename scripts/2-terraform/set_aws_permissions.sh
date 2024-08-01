mkdir -p ~/.aws
cat << EOF > ~/.aws/config
[profile ${AWS_PROFILE_TO_CREATE}]
# we must have a profile to keep commonality with Human use
aws_access_key_id = $(jq -r '.Credentials.AccessKeyId' "${tmp_creds_file}")
aws_secret_access_key = $(jq -r '.Credentials.SecretAccessKey' "${tmp_creds_file}")
aws_session_token = $(jq -r '.Credentials.SessionToken' "${tmp_creds_file}")
EOF