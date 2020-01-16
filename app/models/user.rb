class User < ApplicationRecord

    has_many :photos

    has_many :matches_to, class_name: 'Match', foreign_key: 'liker_id'
    has_many :matches_from, class_name: 'Match', foreign_key: 'liked_id'

    has_many :messages_from, class_name: 'Message', foreign_key: 'sender_id'
    has_many :messages_to, class_name: 'Message', foreign_key: 'recipient_id'

    validates :email, presence: true, uniqueness: true

    has_secure_password

    PASSWORD_REQUIREMENTS = /\A
        (?=.{5,})   # at least 5 characters long
        (?=.*\d)   # contains at least 1 digit
        (?=.*[A-Z])   # contains at least 1 uppercase character
    /x

    validates :password, format: PASSWORD_REQUIREMENTS, allow_nil: true, on: :update

    def matches_with?( other )
        Match.where( liker: self, liked: other ).any? &&
        Match.where( liker: other, liked: self ).any?
    end   # return value is boolean

    def all_matches
        # Returns an array of all users who I have a match with, i.e. they are likers of me, and I am liker of them.
        self.matches_from.map { |match| match.liker } & self.matches_to.map { |match| match.liked }
    end

    def all_messages_with( other )
        Message.where(sender_id: self.id, recipient_id: other.id).or(Message.where(sender_id: other.id, recipient_id: self.id))
    end

    # Tell geocoder where to look to get the human-readable address string (which it'll use to work out the lat/long coordinates).
    geocoded_by :address

    # Tell geocoder to actually turn the above address string into lat/long GPS coordinates (by doing a lookup in a remote API) anytime a user is created/updated.
    after_validation :geocode

end