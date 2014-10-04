class Book < ActiveRecord::Base
  def to_s
    "#{title} - #{author}"
  end
end
