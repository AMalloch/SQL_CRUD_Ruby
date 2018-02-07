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
#   List all the albums they have by an artist
# * Show the artist any album belongs to

  def album()
    sql = 'SELECT * FROM albums WHERE artist_id = $1'
    values = [@id]
    album_info = SqlRunner.run(sql, values)
    return album_info.map{|album| Album.new(album)}
  end
  #
  def self.delete_all()
     sql = "DELETE FROM artists"
     result = SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE artists SET (name) = ($1) WHERE id = $2"
    values = [@names, @id]
    update = SqlRunner.run(sql, values)
    return update.map{|name| Artist.new(name)}
  end

end
