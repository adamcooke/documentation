module Documentation
  module ApplicationHelper
    
    def parse_content(content)
      content.gsub!("<p class=''>{{nav}}</p>") do 
        items = @page.children.map { |c| "<li>#{link_to c.title, page_path(c.full_permalink)}" }.join
        "<ul class='pages'>#{items}</ul>"
      end
      content
    end
    
    def flash_messages
      flashes = flash.collect do |key,msg|
        content_tag :div, content_tag(:p, h(msg)), :id => "flash-#{key}"
      end.join.html_safe
    end
    
  end
end
