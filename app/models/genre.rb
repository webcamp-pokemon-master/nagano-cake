class Genre < ApplicationRecord
   belongs_to :product , optional: true
end
