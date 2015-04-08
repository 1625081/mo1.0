threads 8,32
workers 3
preload_app!
on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
bind 'unix:///home/zhengjinyang/mo1.0/tmp/puma.sock'
stdout_redirect '/home/zhengjinyang/mo1.0/log/stdout', '/home/zhengjinyang/mo1.0/log/stderr'
environment 'production'
daemonize
pidfile '/home/zhengjinyang/mo1.0/tmp/pids/puma.pid'
state_path '/home/zhengjinyang/mo1.0/tmp/pids/puma.state'

