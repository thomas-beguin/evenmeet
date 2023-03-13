class AddLocationToParticipations < ActiveRecord::Migration[7.0]
  def change
    add_column :participations, :location, :float
  end
end
