class Forum < ActiveRecord::Base
  belongs_to :forum, foreign_key: 'parent_id'
  has_many :forums, foreign_key: 'parent_id' 
end
