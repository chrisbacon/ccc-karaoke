require('minitest/autorun')
require('minitest/rg')
require_relative('../person')
require_relative('../song')

class TestPerson < Minitest::Test

    def setup
        @person = Person.new('Chris', 30, 100) 
    end

    def test_person_has_name
        assert_equal('Chris', @person.name)
    end

    def test_person_has_age
        assert_equal(30, @person.age)
    end

    def test_person_has_money
        assert_equal(100, @person.money)
    end

    def test_person_can_pay
        @person.pay(30)
        assert_equal(70, @person.money)
    end

    def test_person_can_sing
        song = Song.new('Leonard Cohen', 'The Stranger Song', ["It's true that all the men you knew were dealers"])
        assert_equal("It's true that all the men you knew were dealers", @person.sing(song))
    end

end
