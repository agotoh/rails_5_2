# rails_5_2

Ruby on Rails 5 速習実践ガイド　の勉強メモ

## メモ

bundle install 時のエラー以下が出たので、rails new した際に設定ファイルを以下のようにする

```
HEADS UP! i18n 1.1 changed fallbacks to exclude default locale.
But that may break your application.

Please check your Rails app for 'config.i18n.fallbacks = true'.
If you're using I18n (>= 1.1.0) and Rails (< 5.2.2), this should be
'config.i18n.fallbacks = [I18n.default_locale]'.
If not, fallbacks will be broken in your app by I18n 1.1.x.

For more info see:
https://github.com/svenfuchs/i18n/releases/tag/v1.1.0
```

## 運用コマンド

```bash
#postgre start
brew services start postgresql
#postgre stop
brew services stop postgresql
#postgre login
psql postgres
# development login
psql scaffold_app_development

```

## rails コマンド

```
# dbにpostgreを使ってアプリケーション作成
bundle exec rails new taskleaf -d postgresql
# db作成
bin/rails db:create
# scaffold
bin/rails generate scaffold user name:string address:string age:integer

# migrate
bin/rails db:migrate
# migrateのステータス確認
bin/rails db:migrate:status
# migrateのロールバック(直近1つ)
bin/rails db:rollback
# migrateのロールバック(直近3つ)
bin/rails db:rollback STEP=3
# migrateロールバック＆再マイグレーション
bin/rails db:migrate:redo STEP=3

# puma 起動
bin/rails s

# routes確認
bin/rails routes

# モデル作成
bin/rails g model [model名][属性名:データ型 属性名:データ型…][オプション]
# コントローラ作成
bin/rails g controller [コントローラ名] [アクション名 アクション名 …][オプション]
```

## slim の導入

Gemfile に以下追加して bundle install

```ruby:Gemfile
gem 'slim-rails'
gem 'html2slim'
```

erb ファイルを slim に変換

```zsh
bundle exec erb2slim app/views/layouts/ --delete
```

## pry-rails の導入

Gemfile

```ruby:Gemfile
group :development, :test do
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
end
```

## Rails のエラーメッセージ等を日本語で出せるようにする

[GitHub の rails-i18n リポジトリ](https://github.com/svenfuchs/rails-i18n/) から、raw ファイルを config/locales.ja.yml としてダウンロード

```zsh
curl -s https://raw.githubusercontent.com/svenfuchs/rails-i18n/master/rails/locale/ja.yml -o config/locales/ja.yml
```

config/initializers/locale.rb を作成し、以下行を追加

```ruby:loale.rb
Rails.application.config.i18n.default_locale = :ja
```

## chapter3 タスク管理アプリケーションの作成

```zsh:
bin/rails g model Task name:string description:text
bin/rails g controller tasks index show new edit
```
