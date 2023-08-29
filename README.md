# docker-knowledge
Docker file for knowledge

- This is Dockerfile that can build a docker image of [Knowledge](https://github.com/support-project/knowledge).


## What's Knowledge
- Free Knowledge Management System

- [Live Demo](https://support-project.org/knowledge/index)

- [Landing page](https://support-project.org/knowledge_info/index)

## build

```sh
docker-compose up -d
```

rebuild
```sh
docker-compose up -d --build --force-recreate
```

log
```sh
docker logs knowledge --tail=100 -f
```

access
```sh
docker exec -it knowledge bash
```

## access 

http://localhost:8082/knowledge/open.knowledge/list