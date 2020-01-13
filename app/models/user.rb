class User < ApplicationRecord
    has_many :photos

    validates :email, presence: true, uniqueness: true

    has_secure_password

    # Specify some requirements for the 'password' field.
    PASSWORD_REQUIREMENTS = /\A
        (?=.{5,})   # at least 5 characters long
        (?=.*\d)   # contains at least 1 digit
        (?=.*[A-Z])   # contains at least 1 uppercase character
    /x

    validates :password, format: PASSWORD_REQUIREMENTS
end