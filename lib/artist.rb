# require_relative './song.rb'
# require_relative './genre.rb'
class Artist 
    extend Concerns::Findable
    attr_accessor :name
    @@all = []
    def initialize (name)
        @name = name
       #@@all << self
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
        new(name).save
    end
    def songs
        Song.all.select do |s| 
            s.artist == self 
        end
    end

    def add_song(song)
       song.artist = self unless song.artist
   end

   def genres
    songs.collect{ |s| s.genre }.uniq
    end
   

end