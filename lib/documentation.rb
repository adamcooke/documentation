# frozen_string_literal: true

require 'haml'
require 'coffee-rails'
require 'sass-rails'
require 'jquery-rails'
require 'dynamic_form'
require 'ostruct'
require 'nifty/attachments'
require 'nifty/dialog'

require 'documentation/version'
require 'documentation/errors'
require 'documentation/engine'
require 'documentation/markdown_renderer'
require 'documentation/view_helpers'
require 'documentation/searchers/abstract'
require 'documentation/search_result'
require 'documentation/config'

module Documentation
end
