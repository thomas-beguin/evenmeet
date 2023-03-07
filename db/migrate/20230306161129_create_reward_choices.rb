class CreateRewardChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :reward_choices do |t|
      t.references :participation, null: false
      t.references :reward, null: false, foreign_key: true

      t.timestamps
    end
    add_foreign_key :reward_choices, :participations, column: :participation_id, primary_key: :id
  end
end
