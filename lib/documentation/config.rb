module Documentation
  
  #
  # Sets the default configuration
  #
  DEFAULT_CONFIGURATION = {
    # This defines the at path where a page can be viewed in
    # the source website. For example, /docs/
    :preview_path_prefix => '/docs/'
  }
  
  #
  # Return configuration options
  #
  def self.config
    @config ||= OpenStruct.new(DEFAULT_CONFIGURATION)
  end
  
end
