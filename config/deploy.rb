# config valid only for current version of Capistrano
# version of capistrano. 固定のバージョンを利用し続け、バージョン変更によるトラブルを防止
lock '3.14.1'

# Capistranoのログの表示に利用
set :application, 'knock-knock'

# アプリを自動でpullするRepositoryを指定
set :repo_url, 'git@github.com:RYgithub1/knock-knock.git'

# バージョンが変わっても共通で参照するディレクトリを指定
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'

# 公開鍵指定
set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/knock.pem']

# プロセス番号を記載したファイルの場所
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# Unicornの設定ファイルの場所
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

# デプロイ処理後、Unicornを再起動するため記述
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end