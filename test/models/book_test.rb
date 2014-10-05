require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "#to_s" do
    assert_equal "Animal Farm - George Orwell", books(:animal_farm).to_s
  end

  test "#match? returns true when term matches the title" do
    assert books(:animal_farm).match?("farm"), "title doesn't include 'farm'"
  end

  test "#match? returns true when term matches the author" do
    assert books(:animal_farm).match?("orwell"), "author doesn't include 'orwell'"
  end

  test "#match? returns false when term doesn't match title or author" do
    refute books(:animal_farm).match?("lorem"), "term matches title or author"
  end
end
