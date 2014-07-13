module Documentation
  class SearchResult
    
    attr_accessor :query
    attr_accessor :time
    attr_accessor :raw_results
    attr_accessor :pages
    
    def initialize
      @time = nil
      @raw_results = {}
    end
    
    def pages
      @pages ||= Documentation::Page.where(:id => raw_results.keys)
    end
    
    def empty?
      self.pages.empty?
    end
    
  end
end
