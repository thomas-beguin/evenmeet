class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.integer :status
      t.references :participation_sender
      t.references :participation_recipient
      t.references :reward, null: false, foreign_key: true

      t.timestamps
    end

    add_foreign_key :relationships, :participations, column: :participation_sender_id, primary_key: :id
    add_foreign_key :relationships, :participations, column: :participation_recipient_id, primary_key: :id
  end
end
