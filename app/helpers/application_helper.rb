module ApplicationHelper
   def form_group_tag(errors, &block)
     css_class = 'form-group'
     css_class << ' has-error' if errors.any?

     content_tag :div, capture(&block), class: css_class
   end

#MARKDOWN
   def markdown(text)
       @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, {
          autolink: true,
          space_after_headers: true,
          fenced_code_blocks: true,
          underline: true,
          highlight: true,
          footnotes: true,
          tables: true
          })
       @markdown.render(text).html_safe
   end

end
