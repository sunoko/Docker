# Laravel on Docker

* Host OS
```
$ sw_vers && docker -v && docker-compose -v
ProductName:	Mac OS X
ProductVersion:	10.12.4
BuildVersion:	16E195
Docker version 17.03.1-ce, build c6d412e
docker-compose version 1.11.2, build dfed245
```

* Deployment instructions
```
# Host OS上で
docker-compose up -d
# aravel_app_1に入る
docker exec -it laravel_app_1 bash
```
```
# laravel_app_1上で
#sunoko_user(web.dockerで作ったユーザー)になってlaravelプロジェクト作成
chown -R sunoko_user:sunoko_user /var/www
su sunoko_user
composer create-project --prefer-dist laravel/laravel laravel

#redis使うのに必要なpredisをcomposerに追加
cd laravel
composer require predis/predis

#/var/www以下ののディレクトリとファイルのアクセス権を変更
find /var/www -type d -exec chmod 770 {} \;
find /var/www -type f -exec chmod 770 {} \;

# laravel/.env編集
ping laravel_mysql_1
ping laravel_redis_1

# mysqlのテーブルを作成
php artisan make:migration create_user

# 作成されたmigrationファイル更新
# その後にテーブルを作成する
cd /var/www/laravel
php artisan migrate

# userstestテーブルがあるか確認
# passはsecret
mysql -h 172.20.0.2 -u root -D laraveltest -p
show tables;
```
```
# laravel/.env変更箇所
DB_HOST=172.20.0.2 #pingで確認したhostを入力
DB_DATABASE=laraveltest
DB_USERNAME=root
DB_PASSWORD=secret

CACHE_DRIVER=redis
SESSION_DRIVER=redis
REDIS_HOST=172.20.0.3 #pingで確認したhostを入力
```
```
# migrationファイル変更箇所
# 2017_04_29_085637_create_user.php
public function up()
{
    Schema::create('userstest', function (Blueprint $table) {
        $table->increments('id');
        $table->string('name');
        $table->timestamps();
    });
}
```