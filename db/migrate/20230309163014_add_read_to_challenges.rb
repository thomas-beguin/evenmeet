class AddReadToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :read, :integer, default: 1
  end
end
