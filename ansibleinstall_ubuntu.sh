#Скрипт установки Ansible в Ubuntu и назначения прав текущему пользователю
sudo apt update -y
sudo apt install software-properties-common -y
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y
#Для обычного пользователя недоступна для редактирования папка в etc
#Создаем отдельную группу с доступом к /etc/ansible
#Добавляем туда текущего пользователя
sudo groupadd -f ansible
user=$(whoami)
sudo usermod -a -G ansible $user
sudo chgrp -R ansible /etc/ansible
sudo chmod -R 775 /etc/ansible
echo "Необходимо перелогиниться для возможности редактирования папки /etc/ansible"
ansible --version
