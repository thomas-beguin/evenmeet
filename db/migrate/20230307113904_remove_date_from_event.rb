class RemoveDateFromEvent < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :date, :date
  end
end
