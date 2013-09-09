class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :name
      t.string :twitter
      t.text :description
      t.string :email

      t.timestamps
    end
  end
end
