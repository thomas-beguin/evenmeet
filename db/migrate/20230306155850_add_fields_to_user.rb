class AddFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :description, :text
    add_column :users, :city,        :string
    add_column :users, :first_name,  :string
    add_column :users, :last_name,   :string
    add_column :users, :tags,        :string
    add_column :users, :position,    :string
  end
end
