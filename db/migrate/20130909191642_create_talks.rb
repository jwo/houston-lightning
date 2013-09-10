class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :name, allow_nil: false
      t.string :twitter, allow_nil: false
      t.text :description, allow_nil: false
      t.string :email, allow_nil: false
      t.datetime :started_at, allow_nil: true

      t.timestamps
    end
  end
end
