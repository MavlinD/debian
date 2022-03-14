## Debian 

Для тестирования и отладки разных фич.

### Запуск сервиса
1. Переименовываем **template.env** в **.env**
2. Можно запускать

### Примечание
- Основан на официальном образе python3.10, тк локально у меня он уже установлен и в настройках окружения исп-ся python модули.
- В комплект входят скрипты для удаления неиспользуемых контейнеров, томов и образов.
- Может работать с докером установленным локально
- Настройки пользователя линкуются внутрь контейнера
- Внутри контейнера время определяется по UTC, планируйте задания с учётом своего часового пояса или определите переменную окружения TZ.
- Войти в работающий контейнер: `docker exec -it debian bash`.

### Лит-ра
1. https://habr.com/ru/post/47163/  
2. https://linuxize.com/post/bash-if-else-statement/
3. https://download.docker.com/linux/static  
4. https://habr.com/ru/company/badoo/blog/468061/  
5. http://rus-linux.net/MyLDP/admin/Alternatives-Cron-For-Linux.html  
6. https://dshearer.github.io/jobber/doc/v1.4/  
