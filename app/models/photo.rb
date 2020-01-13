class Photo < ApplicationRecord
    belongs_to :user, optional: true
end