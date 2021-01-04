class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :comment
      t.string :mood
      t.integer :forum_id

      t.timestamps
    end
  end
end
