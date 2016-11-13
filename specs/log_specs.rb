require('minitest/autorun')
require('minitest/rg')
require_relative('../log')

class TestLog < Minitest::Test

    def setup
        @log = Log.new("Start of log")
    end

    def test_current_message
        assert_equal("Start of log", @log.current_message)
    end

    def test_add_message
        @log.add_message("A message!")
        assert_equal("A message!", @log.current_message)
    end

    def test_message_at_time
        @log.add_message("A message!")
        @log.add_message("A later message!")
        @log.add_message("An even later message!")

        assert_equal("A later message!", @log.message_at_time(2))
    end
end
