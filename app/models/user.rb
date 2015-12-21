class User < ActiveRecord::Base
  validates :username, presence: true
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
