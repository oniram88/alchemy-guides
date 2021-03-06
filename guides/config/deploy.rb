set :application, "alchemy-guides"

set :scm, :none
set :repository,  "./output"
set :deploy_via, :copy
set :deploy_to, "/var/www/alchemy-guides"
set :guide_version, -> do
  branch = `git rev-parse --abbrev-ref HEAD`.strip
  branch == 'master' ? 'edge' : branch
end
set :current_path, "#{deploy_to}/#{guide_version}"
set :user, 'web1'

role :app, "alchemy-cms.com"
set :use_sudo, false

# Override default tasks which are not relevant to a non-rails app.
namespace :deploy do
  task :migrate do
    puts "Skipping migrate."
  end
  task :finalize_update do
    puts "Skipping finalize_update."
  end
  task :start do
    puts "Skipping start."
  end
  task :stop do
    puts "Skipping stop."
  end
  task :restart do
    puts "Skipping restart."
  end
end
