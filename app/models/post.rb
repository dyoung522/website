class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many   :comments
  validates_presence_of :user, :project
end
