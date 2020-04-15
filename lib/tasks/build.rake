namespace :build do

  # This should be run each time the servers are restarted
  task :courses => :environment do
    Clients::Github.new
  end
end
