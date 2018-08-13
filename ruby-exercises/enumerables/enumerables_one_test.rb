require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class EnumerablesOneTest < Minitest::Test
  def test_squares
    numbers = [1, 2, 3, 4, 5]
    actual = numbers.map do |number|
      number ** 2
    end
    assert_equal [1, 4, 9, 16, 25], actual
  end

  def test_find_waldo
    words = ["noise", "dog", "fair", "house", "waldo", "bucket", "fish"]
    actual = words.find do |word|
      word == "waldo"
    end
    assert_equal "waldo", actual
  end

  def test_pick_words_with_three_letters
    words = ["pill", "bad", "finger", "cat", "blue", "dog", "table", "red"]
    actual = words.find_all { |word| word.length == 3 }
    assert_equal ["bad", "cat", "dog", "red"], actual
  end

  def test_normalize_zip_codes
    numbers = [234, 10, 9119, 38881]
    actual = numbers.map do |num|
      if num.digits.count != 5
        z_needed = 5 - num.digits.count
        prefix = ""
        z_needed.times do
          prefix << "0"
        end
        prefix + num.to_s
      else
        num.to_s
      end
    end
    assert_equal ["00234", "00010", "09119", "38881"], actual
  end

  def test_no_waldo
    words = ["scarf", "sandcastle", "flag", "pretzel", "crow", "key"]
    found = words.find { |word| word == "waldo" }
    assert_nil found
  end

  def test_pick_floats
    numbers = [3, 1.4, 3.5, 2, 4.9, 9.1, 8.0]
    actual = numbers.find_all { |num| num.class == Float }
    assert_equal [1.4, 3.5, 4.9, 9.1, 8.0], actual
  end

  def test_pick_dinosaurs
    animals = ["tyrannosaurus", "narwhal", "eel", "achillesaurus", "qingxiusaurus"]
    actual = animals.find_all { |animal| animal.include?("aurus") }
    assert_equal ["tyrannosaurus", "achillesaurus", "qingxiusaurus"], actual
  end

  def test_words_with_no_vowels
    words = ["green", "sheep", "travel", "least", "boat"]
    actual = words.map { |word| word.delete("aeiou")}
    assert_equal ["grn", "shp", "trvl", "lst", "bt"], actual
  end
end
