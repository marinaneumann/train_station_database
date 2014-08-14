require 'rspec'
require 'pg'
require 'stations'
require 'lines'

DB = PG.connect({:dbname => 'train_world_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lines *;")
    DB.exec("DELETE FROM stations *;")
    DB.exec("DELETE FROm stops *;")
  end
end
