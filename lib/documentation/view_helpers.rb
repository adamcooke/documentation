module Documentation
  module ViewHelpers
    
    #
    # Path to edit a page in the manager UI
    #
    def documentation_edit_page_path(page)
      "#{::Documentation::Engine.mounted_path}/edit/#{page.full_permalink}"
    end
    
    #
    # Path to view a page in the manager UI
    #
    def documentation_page_path(page)
      "#{::Documentation::Engine.mounted_path}/#{page.try(:full_permalink)}"
    end
    
    #
    # Return a breadcrumb for the given page
    #
    def documentation_breadcrumb_for(page, options = {})
      options[:root_link] = options[:root_link].nil? ? 'Home' : options[:root_link]
      options[:class]     ||= 'breadcrumb'
      
      String.new.tap do |s|
        s << "<nav class='#{options[:class]}'><ul>"
        
        if options[:root_link]
          s << "<li><a href='#{documentation_doc_root}'>#{options[:root_link]}</a></li>"
        end
        
        if page.is_a?(::Documentation::Page)
          page.breadcrumb.each do |child|
            s << "<li><a href='#{documentation_doc_root}/#{child.full_permalink}'>#{child.title}</a></li>"
          end
        end
        
        s << "</ul></nav>"
      end.html_safe
    end
    
    #
    # Return appropriate content for a given page
    #
    def documentation_content_for(page)
      # Get the content
      content = page.compiled_content.to_s
      
      # Insert navigation
      content.gsub!("<p class=''>{{nav}}</p>") do 
        children = page.children
        children = children.select { |c| documentation_authorizer.can_view_page?(c) }
        items = children.map { |c| "<li><a href='#{documentation_doc_root}/#{c.full_permalink}'>#{c.title}</a></li>" }.join
        "<ul class='pages'>#{items}</ul>"
      end
      
      # Set the document root as appropriate
      content.gsub!("{{docRoot}}", documentation_doc_root)
      
      # Return HTML safe content
      content.html_safe
    end
    
    #
    # Return the documentation document root
    #
    def documentation_doc_root
      @documentation_doc_root ||= begin
        if controller.is_a?(Documentation::ApplicationController)
          ::Documentation::Engine.mounted_path.to_s
        else
          ::Documentation.config.preview_path_prefix.to_s.sub(/\/$/, '')
        end
      end
    end
    
    #
    # Return the documentation authorizer 
    #
    def documentation_authorizer
      @documentation_authorizer ||= Documentation.config.authorizer.new(controller)
    end
    
  end
end
