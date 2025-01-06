# Entry to ansible
vscode access to csa.edu.jkan.pl
``ssh s{album}@csa.edu.jkan.pl ``
    pw uekcracow2024!@

# Entry to ansible
 ansible --version

* start ssh-agent   `` eval $(ssh-agent)`` | `` eval `ssh-agent`  ``

wget http://adsk.dydaktywa.jkan.pl/_static/id_student
chmod 600 id_student
ssh-add id_student
ansible -m ping -i inventory.ini ecommerce
ansible-playbook -i ansible/inventory.ini ansible/install.yaml