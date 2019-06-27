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

  def self.new_by_name (name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    self.all << song
    song
  end

  def self.find_by_name (name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    return self.find_by_name (name) if self.find_by_name (name)
    self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(name)
    song_arr = name.split(/[-.]/)
    song = self.new_by_name(song_arr[1].strip)
    song.artist_name = song_arr[0].strip
    song
  end

  def self.create_from_filename(name)
    self.all << self.new_from_filename(name)
  end
  def self.destroy_all
    self.all.clear
  end
end
