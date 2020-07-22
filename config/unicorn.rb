# サーバ上でのアプリケーションコードが設置されているディレクトリを変数に代入
app_path = File.expand_path('../../../', __FILE__)

# Appサーバの性能を決定（リクエストを受け付けレスポンスを生成するworker(ワーカー)の数を決定）
worker_processes 1

# UnicornがRailsのコードを動かす際、アプリケーションの設置されているディレクトリを指定
working_directory "#{app_path}/current"


# Unicornの起動に必要なファイルの設置場所を指定（起動する際にプロセスidが書かれたファイルを生成）
pid "#{app_path}/shared/tmp/pids/unicorn.pid"


# port番号（どのポート番号のリクエストを受け付けるか）
listen "#{app_path}/shared/tmp/sockets/unicorn.sock"


# [エラーログ]の格納ファイル(-> $less log/unicorn.stderr.log  ,or $tail)
stderr_path "#{app_path}/shared/log/unicorn.stderr.log"


# [通常ログ]の格納ファイル
stdout_path "#{app_path}/shared/log/unicorn.stdout.log"

# Railsアプリの応答待ち上限時間
timeout 60


preload_app true
GC.respond_to?(:copy_on_write_friendly=) && GC.copy_on_write_friendly = true

check_client_connection false

run_once = true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!

  if run_once
    run_once = false
  end

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exist?(old_pid) && server.pid != old_pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH => e
      logger.error e
    end
  end
end

after_fork do |_server, _worker|
  defined?(ActiveRecord::Base) && ActiveRecord::Base.establish_connection
end
