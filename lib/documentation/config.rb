require 'documentation/authorizer'

module Documentation
  
  #
  # Sets the default configuration
  #
  DEFAULT_CONFIGURATION = {
    # This defines the at path where a page can be viewed in
    # the source website. For example, /docs/
    :preview_path_prefix => nil,

    # Should we display developer tips in the UI?
    :developer_tips => true,

    # The authorizer to use
    :authorizer => Documentation::Authorizer
  }
  
  #
  # Return configuration options
  #
  def self.config
    @config ||= OpenStruct.new(DEFAULT_CONFIGURATION)
  end
  
end
