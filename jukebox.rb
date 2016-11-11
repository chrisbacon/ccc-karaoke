class Jukebox
    def initialize(songs)
        @songs = songs
    end

    def number_of_songs()
        return @songs.length
    end

    def add_song(song)
        @songs.push(song)
    end
    
end