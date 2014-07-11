require 'redcarpet'
require 'pygments'

module Documentation
  class MarkdownRenderer < Redcarpet::Render::HTML
  
    include ActionView::Helpers::TagHelper
  
    def header(text, level, anchor)
      "<h#{level} id='#{anchor}'><a href='##{anchor}' class='anchor'>Link</a>#{text}</h#{level}>"
    end
  
    def block_code(code, language)
      title = nil
      code.gsub!(/\A\:\:(.*)$/) { title = $1 ; nil }
      String.new.tap do |s|
        s << "<p class='codeTitle'>#{title}</p>" if title
        s << Pygments.highlight(code, :lexer => language)
      end
    rescue 
      "<div class='highlight'><pre>#{code}</pre></div>"
    end
  
    def image(src, title, alt)
      if alt.gsub!(/\*([\w\-\s]+)\z/, '')
        klass = "imgcontainer #{$1}"
      else
        klass = nil
      end
      content_tag :span, tag(:img, :src => src, :title => title, :alt => alt), :class => klass
    end
  
    def paragraph(text)
      klass = ''
      text.gsub!(/\A(\w+)\:/) do
        klass = $1
        nil
      end
    
      text.sub!(/ ([^ ]+)$/, '&nbsp;\1')
    
      "<p class='#{klass.downcase}'>#{text}</p>"
    end
  
  end
end
