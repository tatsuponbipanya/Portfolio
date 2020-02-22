# frozen_string_literal: true

# ワーカーの数
$worker = 2
# ワーカーの削除時間（秒）
$timeout = 30
# currentディレクトリ
$app_dir = '/var/www/rails/Portfolio/current'
# リクエストを受け取るポート番号
$listen = File.expand_path 'sockets/unicorn.sock', $app_dir
# PIDの管理ファイルディレクトリ
$pid = File.expand_path 'tmp/pids/unicorn.pid', $app_dir
# エラーログを吐き出すファイルのディレクトリ
$std_log = File.expand_path 'log/unicorn.log', $app_dir

# 上記の設定を適用
worker_processes  $worker
working_directory $app_dir
stderr_path $std_log
stdout_path $std_log
timeout $timeout
listen  $listen
pid $pid

# ホットデプロイを行う
preload_app true

# fork前に行うことを定義
before_fork do |server, _worker|
  defined?(ActiveRecord::Base) && ActiveRecord::Base.connection.disconnect!
  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      Process.kill 'QUIT', File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

# fork後に行うことを定義
after_fork do |_server, _worker|
  defined?(ActiveRecord::Base) && ActiveRecord::Base.establish_connection
end
