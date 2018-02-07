require('pry-byebug')
require_relative('models/album.rb')
require_relative('models/artist.rb')

artist1 = Artist.new({
  'name' => 'Gus'
})

album1 = Album.new({
  'title' => 'Nightmare at Codeclan',
  'genre' => 'Horror'
  })

artist1.save
album1.save

all_artists = Artist.all
all_albums = Album.all

binding.pry
nil
