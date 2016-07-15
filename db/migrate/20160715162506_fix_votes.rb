class FixVotes < ActiveRecord::Migration
  def up
    change_column_default(:votes, :vote, 0)
  end

  def down
    change_column_default(:votes, :vote, nil)
  end
end
