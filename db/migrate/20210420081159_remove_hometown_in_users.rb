class RemoveHometownInUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :Tweets, :user_id_id, :references
  end
end
