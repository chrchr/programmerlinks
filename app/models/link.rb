class Link < ActiveRecord::Base
  attr_accessible :name, :url, :username
  validates :name, :url, :username,
    :presence => true

  def upvote
    self.points += 1
  end
end
