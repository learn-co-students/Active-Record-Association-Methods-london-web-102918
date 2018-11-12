class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    Song.all.select{|song| song.genre = self}.length
  end

  def artist_count
    # return the number of artists associated with the genre
    Song.all.select{|song| song.genre = self}.map{|song| song.artist}.uniq.length
  end

  def all_artist_names
    # return an array of strings containing every musician's name
    Artist.all.map{|artist| artist.name}
  end
end
