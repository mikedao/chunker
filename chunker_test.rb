require 'minitest/autorun'
require 'minitest/pride'
require_relative 'chunker.rb'

class ChunkerTest < Minitest::Test
  attr_reader :chunker
  
  def setup
    @string = "Rich thinks a single enumerable can solve this."
    @chunker = Chunker.new
  end

  def test_it_returns_an_array_of_one_when_given_one
    result = chunker.chunk("a")
    assert_equal ["a"], result
  end

  def test_five_characters_gives_a_single_element
    result = chunker.chunk("house")
    assert_equal ["house"], result
  end

  def test_it_can_handle_leftovers
    result = chunker.chunk("houses")
    assert_equal ["house","s"]
  end

  def test_it_can_split_a_large_string_into_chunks_of_five
    result = chunker.chunk(@string)
    assert_equal ["Rich ", "think", "s a s", "ingle", " enum", "erabl", "e can", " solv", "e thi", "s."], result
  end

  def test_it_can_chunk_into_threes
    result = chunker.chunk("houses", 3)
    assert_equal ["hou","ses"]
  end

  def test_it_can_chunk__into_threes_with_leftovers
    result = chunker.chunk("houseses", 3)
    assert_equal ["hou","ses","es"]
  end

end
