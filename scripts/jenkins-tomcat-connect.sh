ssh-keygen
cd .ssh
cat id_rsa
cat id_rsa.pub
ssh -i id_rsa jenkins@172.31.89.99
cd /tmp
aws
aws s3 ls
aws s3 cp s3://munachongo/Deployment/warlog.war /tmp/warlog.war
