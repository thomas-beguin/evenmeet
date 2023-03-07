class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :nature
      t.text :description
      t.date :date
      t.string :address

      t.timestamps
    end
  end
end
