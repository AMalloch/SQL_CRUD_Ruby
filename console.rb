require('pry-byebug')
require_relative('models/album.rb')
require_relative('models/artist.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'name' => 'Gus'
})

artist1.save #this saves to database first before
             #artist_id => artist.id calls it below

album1 = Album.new({
  'title' => 'Nightmare at Codeclan',
  'genre' => 'Horror',
  'artist_id' => artist1.id
  })


album1.save

all_artists = Artist.all
all_albums = Album.all
by_album = artist1.album
by_artist = album1.artist
update = artist1.update

binding.pry
nil
