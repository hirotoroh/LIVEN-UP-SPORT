class RemoveHometownInUserId < ActiveRecord::Migration[6.0]
  def change
    remove_column :tweets, :user_id, :references
  end
end
