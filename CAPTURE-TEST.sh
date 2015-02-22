# starts a make test in ./keyless, and stores it's output to "./make-test.log"
# and captures relevant tcp frames to "./make-test.pcap"
echo Removing previous logs
rm make-test.pcap
rm make-test.log
echo Starting tests...

# note that we hardcode the port here that is defined in keyless/MAKEFILE
tshark -i lo -f "tcp port 30498" -w make-test.pcap &

sudo make -C keyless test > make-test.log
kill $(pidof tshark)
echo Tests complete.