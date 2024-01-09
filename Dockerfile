# 使用したいRubyのimageを指定
FROM ruby:3.2.2

# PostgreSQLクライアントをインストール
RUN apt-get update -qq && apt-get install -y postgresql-client vim
RUN mkdir /app
WORKDIR /app

# yarnパッケージ管理ツールをインストール
RUN apt-get update && apt-get install -y curl apt-transport-https wget
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

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