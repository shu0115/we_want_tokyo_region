class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :sentence, index: true
      t.text :body
      t.text :result

      t.timestamps
    end
  end
end
