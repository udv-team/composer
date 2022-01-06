# /bin/bash

GREEN='\033[0;32m'
RED='\033[0;33m'
BLUE='\033[0;34m'


echo -e ${RED}"Останавливаем и удаляем запущенные контейнеры" && docker-compose down -v &&
  echo -e ${BLUE}"Загружаем образ" && docker-compose pull &&
  echo -e ${BLUE}"Запускаем контейнеры" && docker-compose up -d &&
  echo -e ${BLUE}"Ожидаем поднятия сервисов" && sleep 30 &&
  echo -e ${BLUE}"Запускаем заливку" && docker exec -it cas python3 -m src.fill_data &&
  echo -e ${GREEN}Запуск проекта успешно выполнен