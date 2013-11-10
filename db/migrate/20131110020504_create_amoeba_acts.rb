class CreateAmoebaActs < ActiveRecord::Migration
  def change
    create_table :amoeba_acts do |t|
      t.integer :amoeba_id
      t.integer :act_id

      t.timestamps
    end
    add_index :amoeba_acts, :amoeba_id
    add_index :amoeba_acts, :act_id
  end
end
