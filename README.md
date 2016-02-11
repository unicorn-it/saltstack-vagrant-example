# saltstack-vagrant-example

Example project of how to use Vagrant and Saltstack together.

See also our blog post https://www.unicorn-it.de/saltstack-und-vagrant/

## Usage

Switch on command line into this folder when having cloned.
Make sure having VirtualBox + Vagrant installed on local machine.
 
```Shell
 $ vagrant up
```

Vagrant should download the image givin in Vagrantfile. Afterwards SaltStack is starting 
and executing the configuration from saltstack/salt/top.sls