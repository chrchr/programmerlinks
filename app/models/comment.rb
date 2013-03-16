class Comment < ActiveRecord::Base
  belongs_to :link
  attr_accessible :comment, :username, :link_id
  validates :comment, :username, :link,
    presence: true
end
