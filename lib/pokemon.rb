require "pry"

class Pokemon

  attr_accessor :name, :type, :db, :id

  def initialize(db)
    # binding.pry
    @db = db
    @id = @db[:id]
    @name = @db[:name]
    @type = @db[:type]
  end

  def self.save(name, type, db)
    # binding.pry
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = ?", id).first
    # binding.pry
    Pokemon.new(id: poke[0], name: poke[1], type: poke[2], db: db)
  end

end
