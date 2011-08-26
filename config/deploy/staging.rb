set :domain, "dine-media.com"

set :deploy_to, "/var/www/websites/tech-credentials"

set :user, "rails"
set :use_sudo, false

set :rails_env, "staging"
role :app, "dine-media.com"
role :web, "dine-media.com"
role :db,  "dine-media.com", :primary => true