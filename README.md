`docker-compose build`  
`docker-compose run --rm web /bin/bash`  

# In Container
## new project
`rails new . --webpack=vue -f -d postgresql`  

## Rails
`docker-compose run web rails new . --force --database=postgres --webpack=vue --skip-coffee --skip-test`  
`docker-compose run --rm web bundle install`  

## Webpacker
`docker-compose run web rails webpacker:install`  
`docker-compose run web rails webpacker:install:vue`

## DB
`docker-compose run --rm web rails db:create`  
`docker-compose run --rm web rails db:migrate`  
`docker-compose run --rm web rails db:migrate:reset`  

## pry
`docker attach rails_app_web_1`

## if your app doesn't work, exec following cmd on your app dir
`rm -f app/tmp/pids/server.pid`
