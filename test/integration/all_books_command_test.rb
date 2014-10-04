require 'test_helper'

class AllBooksCommandTest < ActionDispatch::IntegrationTest
  test "returns all the boooks" do
    post "/books", text: "all"

    assert_response :success
    assert_equal [
      books(:animal_farm).to_s,
      books(:nineteen_eighty_four).to_s,
      books(:the_catcher_in_the_rye).to_s,
      books(:the_gambler).to_s
    ].join("\n"), body
  end
end
