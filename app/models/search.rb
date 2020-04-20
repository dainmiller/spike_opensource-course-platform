class Search < Bucket

  def self.for term
    find_all_by term
  end
  
end