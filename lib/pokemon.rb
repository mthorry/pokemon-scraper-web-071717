require "pry"

class Pokemon

  attr_accessor :name, :type, :db, :id

  def initialize(db) #db is the pokemon database that was created in scraper
    # binding.pry
    @db = db #db is the database
    @id = @db[:id] #this calls the database value with key :id
    @name = @db[:name]#this calls the database value with key :name
    @type = @db[:type] #this calls the database value with key :type
  end

  def self.save(name, type, db)
    # binding.pry
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?,?)", name, type)
    # db.execute runs SQL, INSERT name, type into Pokemon table
    # ? values are filled in, IN ORDER, by name, type which are given as args
  end

  def self.find(id, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = ?", id).first
    # set new poke variable equal to item with id value given as arg.first bc nested
    # binding.pry
    Pokemon.new(id: poke[0], name: poke[1], type: poke[2], db: db)
    # poke is now set to a hash of info from pokemon w ID=1. This just calls the values from the poke hash with specified keys
  end

end
