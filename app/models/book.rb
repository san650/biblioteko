class Book < ActiveRecord::Base
  default_scope { order(:title) }

  def to_s
    "#{title} - #{author}"
  end

  def match?(term)
    term = term.downcase

    title.downcase.include?(term) || author.downcase.include?(term)
  end
end
