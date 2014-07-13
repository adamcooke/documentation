module Documentation
  module Searchers
    class Simple < Documentation::Searchers::Abstract
      
      def search(query, options = {})
        result = Documentation::SearchResult.new
        result.pages = Documentation::Page.where("content LIKE ? OR title LIKE ?", "%#{query}%", "%#{query}")
        result
      end
      
      def index(page)
        true
      end
      
    end
  end
end