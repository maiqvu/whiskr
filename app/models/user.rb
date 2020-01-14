class User < ApplicationRecord
    has_many :photos

    has_many :matches_to, class_name: 'Match', foreign_key: 'liker_id'
    has_many :matches_from, class_name: 'Match', foreign_key: 'liked_id'

    validates :email, presence: true, uniqueness: true

    has_secure_password

    PASSWORD_REQUIREMENTS = /\A
        (?=.{5,})   # at least 5 characters long
        (?=.*\d)   # contains at least 1 digit
        (?=.*[A-Z])   # contains at least 1 uppercase character
    /x

    validates :password, format: PASSWORD_REQUIREMENTS

    def matches_with?( other )
        Match.where( liker: self, liked: other ).any? &&
        Match.where( liker: other, liked: self ).any?
    end   # return value is boolean

    def all_matches
        # All users who I have a match with, i.e. they are likers of me, and I am liker of them.
        User.first.matches_from.map { |m| m.liker } & User.first.matches_to.map { |m| m.liked }
    end
end