module ApplicationHelper
  def title (content)
    content_for :page_title do
      content
    end
  end

  def version
    Rails.application.config.version
  end
end
