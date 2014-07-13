namespace :documentation do
  desc "Load a set of initial guides"
  task :install_guides => :environment do
    require File.expand_path('../../../db/seeds', __FILE__)
  end
end
