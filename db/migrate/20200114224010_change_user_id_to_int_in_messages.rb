class ChangeUserIdToIntInMessages < ActiveRecord::Migration[5.2]
  def change
    change_column :messages, :user_id, :integer
    change_column :messages, :conversation_id, :integer
  end
end