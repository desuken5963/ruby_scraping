# Rubyのバージョン2.6.5を使用
FROM ruby:2.6.5

# 必要なパッケージのインストール
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# 作業ディレクトリの設定
WORKDIR /app
