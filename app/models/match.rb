class Match < ApplicationRecord
    belongs_to :liker, class_name: 'User', optional: true
    belongs_to :liked, class_name: 'User', optional: true
end