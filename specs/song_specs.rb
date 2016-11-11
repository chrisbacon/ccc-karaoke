require('minitest/autorun')
require('minitest/rg')
require_relative('../song')

class TestSong < Minitest::Test

    def setup
        @song = Song.new('Leonard Cohen', 'The Stranger Song', ["It's true that all the men you knew were dealers"])
    end

    def test_song_has_artist
        assert_equal("Leonard Cohen", @song.artist)
    end

    def test_song_has_title
        assert_equal("The Stranger Song", @song.title)
    end

    def test_song_has_length
        assert_equal(1, @song.length)
    end

    def test_song_returns_song_lines
        assert_equal("It's true that all the men you knew were dealers", @song.get_song_line(0))
    end

end
