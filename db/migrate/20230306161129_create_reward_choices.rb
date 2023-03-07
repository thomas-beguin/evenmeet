class CreateRewardChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :reward_choices do |t|
      t.integer :status
      t.references :participation, null: false
      t.references :reward, null: false, foreign_key: true

      t.timestamps
    end
  end
end
