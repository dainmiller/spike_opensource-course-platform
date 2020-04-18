Dir["app/models/*.rb"].each do |model|
  begin
    name = model.split('.')[0]
    name = File.basename(name)
    "#{name}".titleize.constantize.destroy_all
  rescue
  end
end

Course.create \
  title: 'Beginner Illustration'
  
Course.create \
  title: 'Ruby on Rails for Beginner'