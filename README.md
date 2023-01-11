# ABOUT

Обычный скрипт преконфига сервера для сервиса( в данном случае писалось под один конкретный, можно переиспользовать под любое количество, т.к. ожидается общая струтура, а докер в принципе убирает большинство проблем с настройкой окружения ), всех сопутствующих директорий для проекта. Разоворот темплейта базы данных, преконфиг роли, установка docker, вручную трогать ничего не нужно, можно только добавлять нужные опции.

# How to run

отредактировать `hosts.yml` в корневой папке проекта - добавить хосты, где нужно запустить скрипт

Вариант запуска из корня проекта: `ansible-playbook -i hosts.yml main.yml`

# About insides

### ./prepare_server/main.yml 

Основной файл роли, задачи которого обязательно заранятся в плейбуке

Внутри есть `handlers notify` - проще говоря у задачи пункт notify, handlers - тригеры, которые мы можем дергать в случае состояния задачи `changed` - таким образом мы эвейдим запуск большинства задач, которые опциональны в случае того, если на сервере уже существует что-то из наших шагов. Желательно ставить на полностью пустой сервер. Или ожидается, что сервер уже был подготовлен по конкретному шаблону, чтобы была полная совместимость.

