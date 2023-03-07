class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.references :reward,       null: false, foreign_key: true
      t.references :relationship, null: false, foreign_key: true
      t.integer    :status,       default: 0

      t.timestamps
    end
  end
end
