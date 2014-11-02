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
      options[:root_link] = options[:root_link].nil? ? t('documentation.helpers.documentation_breadcrumb_for.default_root_link') : options[:root_link]
      options[:class]     ||= 'breadcrumb'

      String.new.tap do |s|
        s << "<nav class='#{options[:class]}'><ul>"

        if options[:root_link]
          s << "<li><a href='#{documentation_doc_root.blank? ? '/' : documentation_doc_root}'>#{options[:root_link]}</a></li>"
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
    # Return a default navigation tree for the given page
    #
    def documentation_navigation_tree_for(page)
      String.new.tap do |s|
        s << "<ul>"
        if page.is_a?(::Documentation::Page)
          page.navigation.select { |p,c| documentation_authorizer.can_view_page?(p) }.each do |p, children|
            s << "<li>"
            s << "<a #{page == p ? "class='active'" : ''} href='#{documentation_doc_root}/#{p.full_permalink}'>#{p.title}</a>"
            unless children.empty?
              s << "<ul>"
              children.select { |c| documentation_authorizer.can_view_page?(c) }.each do |p|
                s << "<li><a #{page == p ? "class='active'" : ''} href='#{documentation_doc_root}/#{p.full_permalink}'>#{p.title}</a></li>"
              end
              s << "</ul>"
            end
            s << "</li>"
          end
        else
          ::Documentation::Page.roots.select { |p| documentation_authorizer.can_view_page?(p) }.each do |page|
            s << "<li><a href='#{documentation_doc_root}/#{page.full_permalink}'>#{page.title}</a></li>"
          end
        end
        s << "</ul>"
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
          ::Documentation::Engine.mounted_path.to_s.sub(/\/$/, '')
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

    #
    # Return summary information for search results
    #
    def documentation_search_summary(result)
      t('documentation.helpers.documentation_search_summary.text', :total_results => result.total_results, :start_result => result.start_result_number, :end_result => result.end_result_number, :query => result.query)
    end

    #
    # Return the search results
    #
    def documentation_search_results(result, options = {})
      options[:class] ||= 'searchResults'
      String.new.tap do |s|
        s << "<ul class='#{options[:class]}'>"
        result.results.each do |page|
          s << "<li>"
          s << "<h4><a href='#{documentation_doc_root}/#{page.full_permalink}'>#{page.title}</a></h4>"
          unless page.parents.empty?
            s << "<p class='in'>#{t('documentation.helpers.documentation_search_results.in')} "
            s << page.parents.map { |c| link_to(h(c.title), "#{documentation_doc_root}/#{c.full_permalink}")}.join(" &#8658; ").html_safe
            s << "</p>"
          end
          s << "<p class='excerpt'>#{result.excerpt_for(page)}</p>"
          s << "</li>"
        end
        s << "</ul>"
      end.html_safe
    end

    #
    # Return search pagination links
    #
    def documentation_search_pagination(result, options = {})
      String.new.tap do |s|
        unless result.first_page?
          querystring = {:query => result.query, :page => result.page - 1}.to_query
          s << link_to(t('documentation.helpers.documentation_search_pagination.previous'), "#{documentation_doc_root}/search?#{querystring}", :class => [options[:link_class], options[:previous_link_class]].compact.join(' '))
        end

        unless result.last_page?
          querystring = {:query => result.query, :page => result.page + 1}.to_query
          s << link_to(t('documentation.helpers.documentation_search_pagination.next'), "#{documentation_doc_root}/search?#{querystring}", :class => [options[:link_class], options[:next_link_class]].compact.join(' '))
        end
      end.html_safe
    end

  end
end
