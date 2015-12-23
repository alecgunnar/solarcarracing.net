class User < ActiveRecord::Base
  include Gravtastic
  gravtastic default: "wavatar"

  validates_presence_of :username, :seo_name
  validates_uniqueness_of :username, case_sensitive: false
  validates :username, format: { with: /\A[a-zA-Z0-9_-]+\z/, message: 'may only contain letters, numbers, dashes, and underscores.' }

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :topics

  def to_param
    "#{id}-#{seo_name}"
  end

  def username= (username)
    write_attribute :username, username
    set_seo_name
  end

  private
    def set_seo_name
      self.seo_name = username.parameterize
    end
end
