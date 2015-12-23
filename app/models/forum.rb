class Forum < ActiveRecord::Base
  belongs_to :category, class_name: 'Forum', foreign_key: 'parent_id'
  has_many :forums, foreign_key: 'parent_id'
  has_many :topics

  after_save :create_seo_name, if: 'seo_name.nil?'

  def to_param
    self.seo_name
  end

  private
    def create_seo_name
      update seo_name: SEO.generate_seo_name(self.id, self.name)
    end
end
