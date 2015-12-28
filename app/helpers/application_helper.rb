module ApplicationHelper
  def title (content)
    content_for :page_title do
      content
    end
  end
end
