require 'pg'

class Station

attr_accessor :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id].to_i
  end

  def self.all
    @stations =[]
    results = DB.exec("SELECT * FROM stations;")
    results.each do |result|
      @stations << Station.new({:id => result['id'],:name =>result['name']})
    end
    @stations
  end

  def delete
    DB.exec("DELETE FROM stations WHERE id = #{@id};")
  end

  def save
    result = DB.exec("INSERT INTO stations (name) VALUES ('#{name}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def ==(another_station)
      self.id == another_station.id && self.name == another_station.name
  end

  def self.find(search_id)
    results = DB.exec("SELECT * FROM stations WHERE id = #{search_id};")[0]
    Station.new({:name => results['name'], :id => results['id']})
  end

end
