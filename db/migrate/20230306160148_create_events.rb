class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :category
      t.string :tags
      t.text   :description
      t.date   :start_date
      t.date   :end_date
      t.string :address

      t.timestamps
    end
  end
end
