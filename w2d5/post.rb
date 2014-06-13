class Post
  
  attr_accessor :doc
  attr_accessor :id
  attr_accessor :title
  attr_accessor :points
  attr_accessor :url

  def initialize(doc, title, points, id, url)
    @doc = doc
    @title = title
    @points = points
    @id = id
    @url = url
  end 
    
  def comments
    Comment.read
  end



  def add_comment
  end
  
end