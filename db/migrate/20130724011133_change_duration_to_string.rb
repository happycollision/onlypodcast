class ChangeDurationToString < ActiveRecord::Migration
  def up
   change_column :episodes, :duration, :string
  end

  def down
   change_column :episodes, :duration, :integer
  end
end
