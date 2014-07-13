module Documentation
  module Searchers
    class Abstract
      
      attr_reader :options
      
      def initialize(options = {})
        @options = options
        setup
      end
      
      #
      # Run whatever initial set up is needed
      #
      def setup
      end
      
      #
      # Search for a page from the index
      #
      def search(query, options = {})
        []
      end
      
      #
      # Delete a page from the index
      #
      def delete(page)
        false
      end
      
      #
      # Reset an index to have no data within it
      #
      def reset
        true
      end
      
      #
      # Add or update an page in the index
      #
      def index(page)
      end
      
    end
  end
end