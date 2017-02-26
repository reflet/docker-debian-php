# Debian8 - PHP7-fpm (日本環境） #

オフィシャルのphp-fpmを元に日本環境の調整を行いました。

### 調整内容 ###

* locale設定 (ja.utf-8)
* タイムゾーン （Asia/Tokyo）
* 必要なツールのインストール (less vim git zip unzip git)
* 画像を扱うためのツールインストール (libfreetype6-dev libjpeg62-turbo-dev libpng12-dev libmcrypt-dev)
* PHPのオプションを追加 (docker-php-ext-install pdo_mysql mysqli mbstring gd iconv mcrypt)
* php-composerインストール

### イメージの作成方法 ###

```
$ git clone https://github.com/reflet/docker-debian-php.git .
$ docker build -t php .
```

### 使い方 ###

```
$ docker run --rm -u "www-data" -it php bash
```