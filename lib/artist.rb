
require 'pry'

class Artist
  
  extend Memorable
  
  # The Artist class is responsible for creating artists instances
  attr_accessor :name
  attr_reader :songs

  @@artists = []

  # An Artist instance is stored in the @@artists class variable when initialized 
  # It is initialized with an empty list of assert_nothing_raised
  def initialize
    @@artists << self
    @songs = []
  end

  # The Artist class method allow to find an Artist instance with a name 
  def self.find_by_name(name)
    @@artists.detect{|a| a.name == name}
  end

  def self.all
    @@artists
  end
  
    
  def self.reset_all 
    self.all.clear
  end
  
  
  def self.count 
    self.all.count
  end
  

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  def to_param
    name.downcase.gsub(' ', '-')
  end
end
