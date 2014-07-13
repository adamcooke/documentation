module Documentation
  module Searchers
    class Simple < Documentation::Searchers::Abstract
      
      def search(query, options = {})
        # Default options
        options[:page]      ||= 1
        options[:per_page]  ||= 15
        
        # Query string 
        query_string = "content LIKE ? OR title LIKE ?", "%#{query}%", "%#{query}"
        
        # Get the total number of pages
        total_results = pages = Documentation::Page.where(query_string).count
        
        # Get the actual pages
        pages = Documentation::Page.where(query_string)
        pages = pages.offset((options[:page].to_i - 1) * options[:per_page].to_i)
        pages = pages.limit(options[:per_page].to_i)
        
        # Create a result object
        result                = Documentation::SearchResult.new
        result.page           = options[:page].to_i
        result.per_page       = options[:per_page].to_i
        result.total_results  = total_results
        result.query          = query
        result.time           = 0
        result.results        = pages
        
        # Return the result
        result
      end
      
      def index(page)
        true
      end
      
    end
  end
end