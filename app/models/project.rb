class Project < ActiveRecord::Base
  has_many :posts
  has_and_belongs_to_many :tags
end
