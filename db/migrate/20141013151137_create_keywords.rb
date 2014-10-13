class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :keyword
      t.references :document, index: true

      t.timestamps
    end
  end
end
