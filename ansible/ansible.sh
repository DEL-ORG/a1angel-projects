 #!/bin/bash

#### update
sudo apt update -y

#### install python
sudo apt install -y python3 python3-pip

# install ansible
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
python3 -m pip install --user ansible
python3 -m pip install --user ansible-core



# install boto3
pip3 install --user boto3
pip install boto3 botocore
/usr/bin/python3 -m pip install boto3 botocore

