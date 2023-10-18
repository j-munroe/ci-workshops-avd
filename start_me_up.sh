#/bin/bash
git config --global user.name "Jim Munroe"
git config --global user.email "jmunroe@gmail.com"
#
pip3 config set global.disable-pip-version-check true
pip3 install "ansible-core<2.15.0"
#
echo "Install AVD Ansible Galaxy Collection: "
ansible-galaxy collection install -r requirements.yml

echo "Set ARISTA_AVD_DIR Variable: "
export ARISTA_AVD_DIR=$(ansible-galaxy collection list arista.avd --format yaml | head -1 | cut -d: -f1)

echo "Install AVD python requirements: "
pip3 install -r ${ARISTA_AVD_DIR}/arista/avd/requirements.txt
#
echo "Spit out the lab pass phrase: "
export LABPASSPHRASE=`cat /home/coder/.config/code-server/config.yaml| grep "password:" | awk '{print $2}'`
echo $LABPASSPHRASE