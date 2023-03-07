class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.integer    :status, default: 0
      t.references :sender
      t.references :receiver

      t.timestamps
    end

    add_foreign_key :relationships, :participations, column: :sender_id, primary_key: :id
    add_foreign_key :relationships, :participations, column: :receiver_id, primary_key: :id
  end
end
