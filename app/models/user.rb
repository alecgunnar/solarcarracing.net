class User < ActiveRecord::Base
  include Gravtastic
  gravtastic default: "wavatar"

  validates_presence_of :username
  validates_uniqueness_of :username, case_sensitive: false

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :topics

  after_save :create_seo_name, if: 'seo_name.nil?'

  def to_param
    self.seo_name
  end

  private
    def create_seo_name
      update seo_name: SEO.generate_seo_name(self.id, self.username)
    end
end
