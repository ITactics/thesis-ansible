Дипломный проект
Название: Автоматизированное развертывание инфраструктуры с помощью Ansible для небольшой компании, занимающейся веб-приложениями

Рассматриваемая виртуальная машина имеет 2 vCPU и 4096 ГБ оперативная памяти. Установка Ansible на Ubuntu 20.04.6.
Ansible >= 2.12.10 

Чтобы установить необходимые пакеты, выполните следующие команды:
sudo apt install software-properties-common

Добавьте репозиторий Ansible, используя следующую команду:
sudo apt-add-repository --yes --update ppa:ansible/ansible

-Установите пакет Ansible:
sudo apt install ansible


Требования:
- Apache
- Nginx
- HAProxy
- MySQL >= 8.0.33
- Zabbix >= 6.4.4
