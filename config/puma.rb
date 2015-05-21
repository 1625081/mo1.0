threads 8,32
workers 3
preload_app!
on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
bind 'unix:///home/mo1.0/tmp/puma.sock'
stdout_redirect '/home/mo1.0/log/stdout', '/home/mo1.0/log/stderr'
environment 'production'
daemonize
pidfile '/home/mo1.0/tmp/puma.pid'
state_path '/home/mo1.0/tmp/puma.state'

