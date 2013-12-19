class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.references :user, index: true
      t.text :words

      t.timestamps
    end
  end
end
