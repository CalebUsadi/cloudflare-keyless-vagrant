# copies local make-test logs (pcap and log) to /vagrant and appends date
echo Copying new logs...
sudo cp make-test.pcap /vagrant/make-test-$(date '+%H.%M.%S').pcap
sudo cp make-test.log /vagrant/make-test-$(date '+%H.%M.%S').log
echo Copied.