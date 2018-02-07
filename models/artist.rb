require('pg')
require_relative('../db/sql_runner')

class Artist

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save
    sql = 'INSERT INTO artists (name) VALUES ($1) RETURNING id'
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  #make a variable called all_artists = Artist.all in console
  #run ruby console.rb , ls in pry, if function is in gold type
  #all_artists and see if it returns everything
  def Artist.all()
    sql = 'SELECT * FROM artists'
    artists = SqlRunner.run(sql)
    return artists.map{|artist| Artist.new(artist)}
  end

end
