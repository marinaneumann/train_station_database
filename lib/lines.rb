require 'pg'

class Line

  attr_accessor :name, :id, :stations_id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id].to_i
  end

  def self.all
    @lines = []
    results = DB.exec("SELECT * FROM lines;")
    results.each do |result|
      @lines << Line.new({:id => result['id'],:name=>result['name']})
    end
    @lines
  end

  def save
    result = DB.exec("INSERT INTO lines (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def ==(another_line)
    self.name == another_line.name
  end

  def self.find(search_id)
    results = DB.exec("SELECT * FROM lines WHERE id = #{search_id};")[0]
    Line.new({:name => results['name'], :id => results['id']})
  end

  def delete
    DB.exec("DELETE FROM lines WHERE id = #{@id};")
  end

  def add_station(sta_id)
    DB.exec("INSERT INTO stops (stations_id,lines_id) VALUES (#{sta_id}, #{@id});")
  end

  def get_stations
    @stations_id = []
    results = DB.exec("SELECT stations.* FROM lines JOIN stops ON (stops.lines_id = lines.id)
                      JOIN stations ON (stops.stations_id = stations.id) WHERE lines.id = #{@id};")

    results.each do |result|
      @stations_id << Station.new({:id =>result['id'], :name => result['name']})
    end
    @stations_id
  end
end
