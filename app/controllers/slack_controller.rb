class SlackController < ApplicationController
  def integration
    books = Book.
      order(:title).
      map {|b| b.to_s}.
      join("\n")

    render plain: books, status: 200
  end
end
