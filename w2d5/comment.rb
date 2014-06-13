class Comment
  @@comments = []
  attr_accessor :comment
  def initialize(comment)
    @comment = comment
  end

  def store
    Comment.create(comment)
  end

  def self.create(comment)
    @@comments << comment.comment
  end

  def self.read
    @@comments
  end



end