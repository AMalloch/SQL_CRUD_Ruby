require('pg')
require_relative('../db/sql_runner.rb')
require_relative('../models/artist.rb')

class Album

  attr_accessor id:, title:, genre:, :artist_id

  @id = options['id'].to_i if options['id']
  @title = options['title']
  @genre = options['genre']
  @artist_id = options['artist_id'].to_i

end
