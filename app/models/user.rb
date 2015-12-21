class User < ActiveRecord::Base
  include Gravtastic
  gravtastic

  validates :username, presence: true
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
