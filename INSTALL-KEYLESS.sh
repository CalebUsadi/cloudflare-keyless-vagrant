sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y wireshark tshark
sudo chmod 4711 `which dumpcap` #for wireshark to function properly
sudo apt-get install -y git
sudo apt-get install -y make gcc unzip automake libtool
sudo apt-get install -y dos2unix
echo Got dependencies and tools
if [ -d "keyless" ]; then
  echo Keyless directory already here, updating git repository
  cd keyless
  git pull origin master
else
  echo Keyless directory not found, cloning from github
  git clone https://github.com/cloudflare/keyless.git
  cd keyless
fi
sudo make && sudo make install
echo Tried to make and install keyless
cd ..
cp /vagrant/CAPTURE-TEST.sh CAPTURE-TEST.sh
cp /vagrant/COPY-TEST-RESULTS.sh COPY-TEST-RESULTS.sh
dos2unix CAPTURE-TEST.sh
dos2unix COPY-TEST-RESULTS.sh
chmod +x CAPTURE-TEST.sh
chmod +x COPY-TEST-RESULTS.sh
echo Placed CAPTURE-TEST.sh and COPY-TEST-RESULTS.sh in home directory
