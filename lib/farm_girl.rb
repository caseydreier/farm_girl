# Use Factories to generate our seed data!

# Require the Gem
require 'factory_girl'
require 'active_support'

module FarmGirl
    
  VERSION = '0.0.1'
  
  class << self
    attr_accessor :seeds
  end

  # Find all seed files in the db/seeds directory and load them,
  # which executes the code and updates the database via Factories
  def self.seed!

    # Load Seeds
    FarmGirl.load_seed_files
    
  end
  
  def self.load_seed_files
    self.seeds = []
    path = 'db/seeds'
    Dir[File.join(path, '*.rb')].each do |file|
      require file
      self.seeds << File.basename(file,'.*')
    end
  end

end