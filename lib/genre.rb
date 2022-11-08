
class Genre 
    extend Concerns::Findable
    attr_accessor :name
    @@all =[]


def initialize (name)
@name = name
#@@all << self
end

def self.all
@@all
end

def self.destroy_all
    all.clear
end

def save
    self.class.all << self
    self 
end

def self.create(name)

    genre = new(name)
genre.save
end

def songs
    Song.all.select do |s| 
        s.genre == self 
end
end
def artists
    songs.collect {|s| s.artist}.uniq
end
end