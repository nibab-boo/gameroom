class CreateMoves < ActiveRecord::Migration[6.1]
  def change
    create_table :moves do |t|
      t.references :gameroom, null: false, foreign_key: true
      t.string :user_name
      t.integer :row
      t.integer :col

      t.timestamps
    end
  end
end
