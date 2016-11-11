class Jukebox
    attr_reader :current_song
    def initialize(songs)
        @songs = songs
        @current_song = nil
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

    def select_song_by_title(title)

        titles = @songs.map{ |song| song.title}
        i = titles.index(title)
        @current_song = @songs[i]

    end


    
end