class Conversation < ApplicationRecord

    # 'foreign_key' argument to specify that sender_id and receiver_id both come from the 'users' table.
    belongs_to :sender, class_name: 'User', foreign_key: 'sender_id', optional: true
    belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id', optional: true

    has_many :messages

    # Uniqueness check to ensure that only one conversation is created between any two users, regardless of who sends and who receives.
    validates_uniqueness_of :sender_id, scope: :receiver_id

    # Takes the sender_id and receiver_id for the conversation and checks whether a conversation exists between these two IDs.
    def self.between( sender_id, receiver_id )
        where("(conversations.sender_id = ? AND conversations.receiver_id = ?) OR (conversations.receiver_id = ? AND conversations.sender_id = ?)")
    end

end