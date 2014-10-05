require 'test_helper'

class SearchBooksCommandTest < ActionDispatch::IntegrationTest
  test "returns all the books from george orwell" do
    post "/books", text: "search george orwell"

    assert_response :success
    assert_equal [
      books(:animal_farm).to_s,
      books(:nineteen_eighty_four).to_s,
    ].join("\n"), body
  end
end
