# 使用したいRubyのimageを指定
FROM ruby:3.2.2

# PostgreSQLクライアントをインストール
RUN apt-get update -qq && apt-get install -y postgresql-client vim
RUN mkdir /app
WORKDIR /app

# imagemagickをインストール
RUN apt-get update && apt-get install -y imagemagick libmagickwand-dev

# Gemをインストール
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

# Rails固有のエントリーポイント対応
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Railsサーバーの起動
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]