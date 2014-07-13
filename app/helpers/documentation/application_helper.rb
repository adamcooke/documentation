module Documentation
  module ApplicationHelper
    
    include Documentation::ViewHelpers
    
    def flash_messages
      flashes = flash.collect do |key,msg|
        content_tag :div, content_tag(:p, h(msg)), :id => "flash-#{key}"
      end.join.html_safe
    end
    
  end
end
