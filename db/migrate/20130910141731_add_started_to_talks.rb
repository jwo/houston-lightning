class AddStartedToTalks < ActiveRecord::Migration
  def change
    add_column :talks, :current_talk, :boolean, default: false, allow_nil: false
  end
end
