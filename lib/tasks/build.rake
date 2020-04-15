namespace :build do

  # This should be run each time the servers are restarted
  task :data => :environment do
    Clients::Github.new
  end
  
end
