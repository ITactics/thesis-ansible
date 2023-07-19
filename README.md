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


Создайте файл Ansible Vault. Необходимые пары ключ-значение хранятся в файле secrets.yaml. Используйте безопасный пароль для шифрования, так как этот файл будет содержать конфиденциальные данные.

Вот несколько примеров команд:
Создание нового файла secrets.yaml:
ansible-vault create secrets.yaml

Редактирование существующего файла secrets.yaml
ansible-vault edit secrets.yaml

Расшифровка файла secrets.yaml:
ansible-vault decrypt secrets.yaml

Варианты запуска плейбука с использованием зашифрованного файла secrets.yaml:

1. Запуск с использованием параметра --ask-vault-pass
   ansible-playbook your_playbook.yaml --ask-vault-pass
В этом случае Ansible запросит пароль для расшифровки файла secrets.yaml и использует его для расшифровки данных.

2. Запуск с использованием переменной окружения -e @secrets.yaml
   ansible-playbook your_playbook.yaml -e @secrets.yaml
В этом случае зашифрованные данные из файла secrets.yaml будут загружены и использованы без запроса пароля, если файл был зашифрован с помощью команды ansible-vault encrypt.

Требования:
- Apache
- Nginx
- HAProxy
- MySQL >= 8.0.33
- Zabbix >= 6.4.4
