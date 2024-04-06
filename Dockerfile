# Rubyのバージョン2.6.5を使用
FROM ruby:2.6.5

# 必要なパッケージのインストール
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# 作業ディレクトリの設定
WORKDIR /app

# ローカルのGemfileとGemfile.lockをコンテナにコピー
COPY Gemfile /Gemfile
# COPY Gemfile.lock /app/Gemfile.lock

# Bundlerを使用してGemをインストール
RUN bundle install

# ローカルのプロジェクトディレクトリをコンテナの作業ディレクトリにコピー
COPY . /app

# コンテナが起動した後にbashシェルを起動
CMD ["/bin/bash"]
