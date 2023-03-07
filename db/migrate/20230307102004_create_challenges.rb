class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.text :description
      t.references :reward, null: false, foreign_key: true
      t.references :relationship, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
