class Catalog
  include ActiveModel::Conversion
  
  def courses
    Course.published.ordered
  end
  
  def repos
    Clients::Github.all
  end
  
  def repositories
    repos
  end
  
end