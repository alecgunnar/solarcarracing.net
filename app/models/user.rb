class User < ActiveRecord::Base
  include Gravtastic
  gravtastic default: "wavatar"

  validates_presence_of :username, :seo_name
  validates_uniqueness_of :username, case_sensitive: false

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  before_validation :prepare_user

  def to_param
    self.seo_name
  end

  private
    def prepare_user
      self.seo_name = self.username.downcase
    end
end
