#require_relative './artist.rb'
#require_relative './genre.rb'

class Song 


    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []
    def initialize (name,artist = nil, genre = nil)
        @name = name
        #@@all << self
        self.artist = artist if artist
        self.genre = genre if genre
    end
    def self.all
        @@all
    end
    def self.destroy_all
        @@all.clear
    end
    def save
        self.class.all << self
        self
    end
    def self.create(name)
        song = new(name)
        song.save
        song


    end
    def artist= (artist)
        @artist = artist
        artist.add_song(self)

    end
    def genre=(genre)
        @genre = genre
        #genre.song = self unless genre.songs.include?(self)
      end
def self.find_by_name(name)
    all.find {|n| n.name == name}

end
def self.find_or_create_by_name(name)
   find_by_name(name) || create(name)
   
end
def self.new_from_filename(file_name)
    song_info = file_name.split(" - ")
    artist_name, song_name, song_genre  = song_info[0], song_info[1], song_info[2].gsub(".mp3", "") 

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(song_genre)
    
    new(song_name, artist, genre)
end
    def self.create_from_filename(file_name)
        new_song = self.new_from_filename(file_name)
        new_song.save
    end
end 