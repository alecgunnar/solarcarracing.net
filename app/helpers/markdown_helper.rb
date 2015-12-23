module MarkdownHelper
  @@core = Redcarpet::Markdown.new Redcarpet::Render::HTML.new(filter_html: true, hard_wrap: true)

  def markdown
    @@core
  end
end