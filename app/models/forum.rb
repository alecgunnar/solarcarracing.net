class Forum < ActiveRecord::Base
  belongs_to :category, class_name: 'Forum', foreign_key: 'parent_id'
  has_many :forums, foreign_key: 'parent_id'
  has_many :topics
end
