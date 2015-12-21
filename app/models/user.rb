class User < ActiveRecord::Base
  include Gravtastic
  gravtastic default: "wavatar"

  validates :username, presence: true
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
