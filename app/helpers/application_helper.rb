require 'redcarpet'

module ApplicationHelper
   def form_group_tag(errors, &block)
     css_class = 'form-group'
     css_class << ' has-error' if errors.any?

     content_tag :div, capture(&block), class: css_class
   end

  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer:language)
    end
  end

  def markdown(content)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, {
      autolink: true,
      space_after_headers: true,
      fenced_code_blocks: true,
      disable_indented_code_blocks: true,
      highlight: true,
      footnotes: true,
      tables: true
    })
    @markdown.render(content)
  end

end
