class CreateRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :rewards do |t|
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
