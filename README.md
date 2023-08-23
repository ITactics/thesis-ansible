# Дипломный проект
## Название
Автоматизированное развертывание инфраструктуры с помощью Ansible для небольшой компании, занимающейся веб-приложениями

## Виртуальная машина
Рассматриваемая виртуальная машина имеет 2 vCPU и 4096 ГБ оперативной памяти.

## Установка Ansible
Установка Ansible производится на Ubuntu 20.04.6 с версией Ansible >= 2.12.10.

Для установки необходимых пакетов, выполните следующую команду:

``` bash
  sudo apt install software-properties-common
  ```

Добавьте репозиторий Ansible с помощью следующей команды:
<pre>
``` bash
sudo apt-add-repository --yes --update ppa:ansible/ansible
  ```
</pre>

Установите пакет Ansible:
<pre>
``` bash
sudo apt install ansible
  ```
</pre>

Ansible Vault
Для обеспечения безопасности конфиденциальных данных, создайте файл Ansible Vault. Пары ключ-значение хранятся в файле secrets.yaml. Используйте надежный пароль для шифрования, так как этот файл будет содержать конфиденциальные данные. Также создайте файл vault_password.txt, где будет храниться пароль для доступа к файлу secrets.yaml.

Раскомментируйте и установите значение в ansible.cfg:
<pre>
``` bash
vault_password_file = /путь/к файлу/vault_password.txt
  ```
</pre>

Примеры команд:

Создание нового файла secrets.yaml:
<pre>
``` bash
ansible-vault create secrets.yaml
  ```
</pre>

Редактирование существующего файла secrets.yaml:
<pre>
``` bash
ansible-vault edit secrets.yaml
  ```
</pre>

Расшифровка файла secrets.yaml:
<pre>
``` bash
ansible-vault decrypt secrets.yaml
  ```
</pre>

Запуск плейбука с зашифрованными данными

Запуск с использованием параметра `--ask-vault-pass`
<pre>
``` bash
ansible-playbook your_playbook.yaml --ask-vault-pass
  ```
</pre>

В этом случае Ansible запросит пароль для расшифровки файла secrets.yaml и использует его для расшифровки данных.

Запуск с использованием переменной окружения `-e @secrets.yaml`
<pre>
``` bash
ansible-playbook your_playbook.yaml -e @secrets.yaml
  ```
</pre>

В этом случае зашифрованные данные из файла secrets.yaml будут загружены и использованы без запроса пароля, если файл был зашифрован с помощью команды `ansible-vault encrypt`.

* Требования
  * Apache
  * Nginx
  * HAProxy
  * MySQL >= 8.0.33
  * PHP >= 7.4
  * Zabbix >= 6.4.4
