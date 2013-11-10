class CreateAmoebas < ActiveRecord::Migration
  def change
    create_table :amoebas do |t|
      t.string :name
      t.integer :talent_id
      t.integer :generation

      t.timestamps
    end
    add_index :amoebas, :talent_id
  end
end
