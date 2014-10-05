class SlackController < ApplicationController
  def integration
    books = Book.all

    if params[:text] =~ /^search\s/
      term = params[:text].gsub(/^search\s/, "")
      books.
        to_a.
        delete_if { |b| !b.match?(term) }
    end

    render plain: serialize(books), status: 200
  end

  private

  def serialize(books)
    books.map(&:to_s).join("\n")
  end
end
