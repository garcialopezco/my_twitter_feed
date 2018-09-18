class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :user_name
      t.string :user_screen_name
      t.text :content
      t.datetime :tweeted_at

      t.timestamps
    end
  end
end
