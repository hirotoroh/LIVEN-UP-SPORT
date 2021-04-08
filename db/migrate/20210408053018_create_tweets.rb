class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string     :title,       null: false
      t.string     :video_url,   null: false
      t.text       :description, null: false
      t.timestamps
    end
  end
end
