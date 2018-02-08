require('pg')
require('pry')
require_relative('../db/sql_runner.rb')
require_relative('../models/artist.rb')

class Album

  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize(options)

    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i

  end

  def save
    sql = 'INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id'
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def Album.all()
    sql = 'SELECT * FROM albums'
    albums = SqlRunner.run(sql)
    return albums.map{|album| Album.new(album)}
  end

  def artist
    sql = 'SELECT * FROM artists WHERE id = $1'
    values = [@artist_id]
    artist_info = SqlRunner.run(sql, values)
    # binding.pry
    result = Artist.new(artist_info[0])
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    result = SqlRunner.run(sql)
  end

  # def update()
  #   sql = "UPDATE albums SET (title, genre, artist_id) = ($1, $2, $3) WHERE id = $4"
  #   values = [@title, @genre, @artist_id]
  #   update = SqlRunner.run(sql, values)
  # end

end
