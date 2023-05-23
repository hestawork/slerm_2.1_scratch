# Week 01. Scratch Task (Slurm Навыкум "Build Containers!")

## Задача

Есть микро-сервис на Go (исходники сервиса и хранятся в этом каталоге). Необходимо упаковать в Docker-образ, используя в качестве базы [Scratch](https://hub.docker.com/_/scratch) (ведь все мы знаем, что Scratch &ndash; это круто и Go "просто создан для него" 😈).

### Формулировка разработчика

Разработчик сказал следующее* (дословно):
> Стандартный проект на Go, собираем командой `go build -o app.bin cmd/main.go`, сейчас сборка описана в `Dockerfile`
>
> Умеет загружать файлы (HTTP Multipart в поле `file`), отправленные на `http://localhost:9000/upload`, кладёт их в каталог `./upload`
>
> В ответ придёт код 200

Примечание*: помните, что к сожалению, не всё, что говорят разработчики, является достоверным

Что нужно сделать (дословно):
> Упаковать всё в Docker, указать, что `/upload` нужно подключать как `VOLUME` (за основу взять исходный `Dockerfile`)
> 
> Никаких `entrypoint.sh` и других sh-скриптов писать не нужно
> 
> Переделывать приложение (редактировать исходный код) тоже не нужно
> 
> Никаких тестов, проверок стиля кода, проверок безопасности (в том числе сканирования зависимостей и образов на уязвимости) делать не нужно
>
> Сборку при необходимости организовать в виде Multi-Stage
>
> Запускать приложение нужно не от root'а (прописывайте это явно в `Dockerfile`)
> 
> Выложить всё в виде публичного образа на GHCR (GitHub Container Registry), чтобы мы могли сами затестить и переиспользовать

### Требования

1. Всё должно быть оформлено в виде публичного репозитория на GitHub
2. Вся сборка образов должна проходить через GitHub Actions
3. Образ должен выкладываться в GitHub Container Registry (GHCR)

К текущему заданию дополнительно предъявляются требования:
1. Docker Legacy Build ([`DOCKER_BUILDKIT=0 docker build .`](https://github.com/docker/cli/pull/3314))
2. Multi-Stage
