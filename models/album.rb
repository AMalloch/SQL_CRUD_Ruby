require('pg')
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
    sql = 'INSERT INTO albums (title) VALUES ($1) RETURNING id'
    values = [@title]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def Album.all()
    sql = 'SELECT * FROM albums'
    albums = SqlRunner.run(sql)
    return albums.map{|album| Album.new(album)}
  end

end
