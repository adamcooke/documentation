module Documentation
  class SearchResult
    
    attr_accessor :query
    attr_accessor :time
    attr_accessor :raw_results
    attr_accessor :results
    attr_accessor :page
    attr_accessor :per_page
    attr_accessor :total_results
    
    def initialize
      @time = nil
      @raw_results = {}
      @page = 1
      @total_pages = 1
      @per_page = nil
    end
    
    #
    # Return the pages
    #
    def results
      @results ||= begin
        results = Documentation::Page.where(:id => raw_results.keys).includes(:parent).to_a
        results.sort_by { |p| raw_results.keys.index(p.id) }
      end
    end
    
    #
    # Return the highlight string for a given page
    #
    def excerpt_for(page)
      if @raw_results[page.id] && hl = @raw_results[page.id][:highlights]
        ERB::Util.html_escape((hl.join("..."))).gsub('{{{', "<mark>").gsub("}}}", "</mark>").html_safe
      else
        page.content[0,255].gsub(/[\n\r]/, '') + "..."
      end
    end
    
    #
    # Is the result set empty?
    #
    def empty?
      self.results.empty?
    end
    
    #
    # The total number of pages in the result set
    #
    def total_pages
      (total_results / per_page.to_f).ceil
    end
    
    #
    # The number of the first result on the current page
    #
    def start_result_number
      ((page - 1) * per_page) + 1
    end
    
    #
    # The number of the last result on the current page
    #
    def end_result_number
      start_result_number + (results.size) - 1
    end
    
    #
    # Is this the first page of the result set?
    #
    def first_page?
      page == 1
    end
    
    #
    # Is this the last page of the result set?
    #
    def last_page?
      page == total_pages
    end
    
  end
end
