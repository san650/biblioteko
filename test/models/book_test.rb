require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "#to_s" do
    assert_equal "Animal Farm - George Orwell", books(:animal_farm).to_s
  end
end
