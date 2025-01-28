Учебный проект с  прохождения курса yandex devops, портирован с гитлаба, все переменные и ключи не актуальны
# Momo Store aka Пельменная №2

## Frontend

```bash
npm install
NODE_ENV=production VUE_APP_API_URL=http://localhost:8081 npm run serve
```

<img width="900" alt="image" src="https://user-images.githubusercontent.com/9394918/167876466-2c530828-d658-4efe-9064-825626cc6db5.png">

## [Momo-store](http://momo.r-shy-t.site/)

## Backend

```bash
go run ./cmd/api
go test -v ./... 
```

## CI/CD

- используется единый [репозиторий](https://gitlab.praktikum-services.ru/std-030-18/diplom)
- при изменениях в соответствующих директориях триггерятся pipeline для backend, frontend и infrastructure (momo-store-helm) где деплой проходит в manual режиме
- backend и frontend проходят этапы сборки, тестирования, релиза, деплоя в dev-окружение (docker-compose) и prod-окружение (k8s)

## Инфраструктура

Для развертывания и настройки используйте следующие команды. В папке infra размещены конфигурационные файлы для работы с Terraform и Helm.

cd infra/terraform
terraform init
terraform apply -var-file="your_settings.file"

## Мониторинг и логирование

Мониторинг настроен с помощью стека Prometheus-Stack для Kubernetes, а логирование организовано с помощью стека Loki. Все данные можно просмотреть в Grafana по следующей ссылке: [Grafana](http://grafana.r-shy-t.site/)

Установка мониторинга

Для установки мониторинга следуйте инструкциям из документации: [Установка мониторинга](https://github.com/prometheus-community/helm-charts/blob/main/charts/kube-prometheus-stack/README.md)

Установка логирования

Инструкции по установке логирования можно найти здесь: [Установка логирования](https://yandex.cloud/ru/docs/managed-kubernetes/operations/applications/loki)
