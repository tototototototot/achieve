server '13.115.76.48', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '~/.ssh/id_rsa'
