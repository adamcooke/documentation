module Documentation
  module Searchers
    class Abstract
      
      attr_reader :options
      
      def initialize(options = {})
        @options = options
        setup
      end
      
      def setup
      end
      
      def search(query, options = {})
        []
      end
      
      def index(page)
      end
      
      def index_all
        Documentation::Page.all.each do |page|
          index(page)
        end
      end
      
    end
  end
end