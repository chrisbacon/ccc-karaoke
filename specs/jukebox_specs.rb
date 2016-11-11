require('minitest/autorun')
require('minitest/rg')
require_relative('../jukebox')
require_relative("../song")

class TestJukebox < Minitest::Test

    def setup
        @song1 = Song.new('Leonard Cohen', 'The Stranger Song', ["It's true that all the men you knew were dealers"])
        @song2 = Song.new('Prince', 'Raspberry Beret', ["I was working part time at a five and dime", "my boss was Mr. McGee"])

        songs = [@song1]

        @jukebox = Jukebox.new(songs)

    end

    def test_number_of_songs
        assert_equal(1, @jukebox.number_of_songs)
    end

    def test_add_songs
        @jukebox.add_song(@song2)
        assert_equal(2, @jukebox.number_of_songs)
    end
    
end
