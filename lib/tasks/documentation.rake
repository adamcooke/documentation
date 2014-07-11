namespace :documentation do
  desc "Load seed data for Documentation"
  task :seed => :environment do
    require File.expand_path('../../../db/seeds', __FILE__)
  end
end
