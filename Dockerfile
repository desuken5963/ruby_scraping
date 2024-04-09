# Rubyのバージョン3.0.3を使用
FROM ruby:3.0.3

# nokogiriのinstall
RUN gem install nokogiri

# 作業ディレクトリの設定
WORKDIR /app
