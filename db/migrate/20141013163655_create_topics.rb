class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :topic
      t.references :document, index: true

      t.timestamps
    end
  end
end
