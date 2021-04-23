class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.text :photo_avatar

      t.timestamps
    end
  end
end
