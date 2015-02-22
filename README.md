keyless-vagrant
===============

# Windows

+ Install Vagrant (don't reboot)
+ Enable Hyper-v
+ Reboot
+ Create a virtual switch in Hyper-v Manager with external network access
+ open an admin command prompt in this directory
+ run `vagrant up`. if there's any errors, you can try provisioning again with `vagrant provision`

# Other OSes

+ Install Vagrant (don't reboot)
+ Install VirtualBox
+ Reboot
+ run `vagrant up`. if there's any errors, you can try provisioning again with `vagrant provision`

# Then what?

You can login to the vagrant box with `vagrant ssh` and `cd keyless` and then run one of the options from [here](https://github.com/cloudflare/keyless#makefile). I'd recommend `make test`. In fact, i'd recommend it so much so that i wrote `CAPTURE-TEST.sh` which should be copied to your home directory. You can run that, and capture the results of a `make test` as both a log file (`./make-test.log`) of the command output, and a pcap file (`./make-test.pcap`) of the wireshark network activity trace.

# Misc notes

+ During the initial provision you'll probably see a fair amount of red. as long as it doesn't end in red, you're probably fine.
+ Initial provision may take 10+ minutes; we grab a bunch of dependencies, update a bunch of stuff, grab the keyless source, and build it.