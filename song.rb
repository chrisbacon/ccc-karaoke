class Song

    attr_reader :artist, :title, :length

    def initialize(artist, title, lyrics)
        @artist = artist
        @title = title
        @lyrics = lyrics
        @length = lyrics.length
    end

    def get_song_line(line_number)
        return @lyrics[line_number]
    end
    
end