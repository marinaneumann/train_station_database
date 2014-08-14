class Line

  attr_accessor :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id].to_i
  end

  def self.all
    @lines = []
    results = DB.exec("SELECT * FROM lines;")
    results.each do |result|
      @lines << Line.new({:name=>result['name']})
    end
    @lines
  end

  def save
    result = DB.exec("INSERT INTO lines (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first['id']
  end

  def ==(another_line)
    self.name == another_line.name
  end

end
