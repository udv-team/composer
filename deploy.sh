for address in 85.208.208.13 45.144.64.103
do
  echo 'Обновляем сервер' $address
  scp docker-compose.yaml start_with_fill.sh root@$address:/root/udv-team
  ssh -t root@$address 'cd udv-team/; bash start_with_fill.sh'
  echo 'Удаляем старые образы'
  ssh -t root@$address 'yes | docker system prune && yes | docker image prune -a'
done
