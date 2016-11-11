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

    def get_song_titles_by_artist()

        songs_by_artist = Hash.new([])

        for song in @songs
            songs_by_artist[song.artist] += [song.title]
        end

        return songs_by_artist

    end
    
end