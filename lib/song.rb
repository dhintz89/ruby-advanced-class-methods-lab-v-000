class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end
  
  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    song_artist, song_name = filename.chomp!(".mp3").split(" - ")
    song = self.new
    song.name = song_name
    song.artist_name = song_artist
    song
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
    self.all << song
  end
    
end

song_1 = Song.create_by_name("Alright")

puts Song.find_or_create_by_name("Alright")
puts Song.find_or_create_by_name("Hold Tight")

