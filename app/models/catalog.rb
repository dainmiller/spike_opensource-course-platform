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
  
  def tracks_on course: Clients::Github.all.first
    course.tracks
  end
  
end
