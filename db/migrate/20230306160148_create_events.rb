class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :category
      t.string :tags
      t.text   :description
      t.datetime   :start_date
      t.datetime   :end_date
      t.string :address

      t.timestamps
    end
  end
end
