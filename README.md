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

# rails s
bin/rails s
```

## rails コマンド

```
bundle exec rails new taskleaf -d postgresql
bin/rails db:create
bin/rails generate scaffold user name:string address:string age:integer
bin/rails db:migrate

```

## slim の導入

Gemfile に以下追加して bundle install

```yaml:Gemfile
gem 'slim-rails'
gem 'html2slim'
```

erb ファイルを slim に変換

```zsh
bundle exec erb2slim app/views/layouts/ --delete
```

## pry-rails の導入

Gemfile

```yaml:Gemfile
group :development, :test do
gem 'pry-rails'
gem 'pry-doc'
gem 'pry-byebug'
gem 'pry-stack_explorer'
end
```
