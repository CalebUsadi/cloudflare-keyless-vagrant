# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.synced_folder "./", "/vagrant"

  # Install and build keyless
  config.vm.provision "shell", path: "INSTALL-KEYLESS.sh"

  # If we're pushing to azure, jump through some hoops
  config.vm.provider :azure do |azure|
    # Requires you to generate a certificate. use `makecert.exe -r -pe -a sha1 -n "CN=My Azure Management Certificate" -ss My -sr CurrentUser -len 2048 -sky exchange -sp "Microsoft Enhanced RSA and AES Cryptographic Provider" -sy 24`
    # Then open certmgr.msc and export the generated public key as a .cer. Upload that here: https://manage.windowsazure.com/<AZURE_ACCOUNT>#Workspaces/AdminTasks/ListManagementCertificates where AZURE_ACCOUNT is something like @benbengreenier.onmicrosoft.com
    # Then use `certutil -store -user My` and find the entry for subject `My Azure Management Certificate` and note it's serial number
    # Then use `certutil -exportPFX -p "" -user My <serial number> <path to write>` to a location only your user account can access, and set a user variable `AZURE_MGMT_CERT_PATH` to point there
    azure.mgmt_certificate = ENV['AZURE_MGMT_CERT_PATH']
    
    azure.mgmt_endpoint = 'https://management.core.windows.net' # always the same

    # Requires you to go to https://manage.windowsazure.com/<AZURE_ACCOUNT>#Workspaces/AdminTasks/SubscriptionMapping where AZURE_ACCOUNT is something like @benbengreenier.onmicrosoft.com
    # And copy your subscription id. Then set a user variable `AZURE_SUBSCRIPTION_ID` to the copied id
    azure.subscription_id = ENV['AZURE_SUBSCRIPTION_ID']
    
    # This should eventually be set by the box, but until i make a custom box, this is how we manually set it
    # Luckily, it's super logically named....
    # This name comes from `azure vm list --json` and searching for the latest entry for the label:"Ubuntu Server 12.04.5 LTS"
    azure.vm_image = 'b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-12_04_5-LTS-amd64-server-20150204-en-us-30GB'

    # This is useless without the azure ip, so it's okay to store it here in plaintext
    azure.vm_password = 'N0ns3ns3!' # min 8 characters. should contain a lower case letter, an uppercase letter, a number and a special character

    azure.vm_name = 'cf-keyless-vagrant' # max 15 characters. contains letters, number and hyphens. can start with letters and can end with letters and numbers
    
    # Change this if you aren't in EAST US
    azure.vm_location = 'East US'

    # These files are used for ssh authentication setup. If you're ssh keys where generating by `git-bash`, or any other windows util that follows the
    # same naming scheme, these defaults should just work. otherwise generate an ssh keypair and put them in the locations below     
    azure.private_key_file = '%useprofile%\\.ssh\\id_rsa'
    azure.certificate_file = '%useprofile%\\.ssh\\id_rsa.pub'

    azure.ssh_port = '22' # always the same
  end
end
