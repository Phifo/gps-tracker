# GPS Tracker

## Comenzar

### Docker
Este proyecto está en docker por lo que se necesita construir las imágenes y levantarlas
```
docker-compose build
docker-compose up
```

### Base de datos
Ahora debemos crear la base de datos y ejecturar los seeds con `rails db:setup`. Esto se puede hacer anteponiento `docker-compose run web` o entrando al contenedor.

```
docker exec -it gps-tracker_web_1 bash
rails db:setup
```

ó

```
docker-compose web run rails db:setup
```

### Rake task
Hay un rake task que crea waypoints de ejemplo cada 10 segundos

```
rails waypoints:generate_points
```

Nota: Este rake task debe ser ejecutado dentro del contenedor o sino dará problemas con el hostname


### Tests
```
rspec
```
