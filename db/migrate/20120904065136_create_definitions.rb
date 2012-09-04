class CreateDefinitions < ActiveRecord::Migration
  def change
    create_table :definitions do |t|
      t.string     :name,       null: false
      t.string     :executable, null: false
      t.references :user,       null: false
      t.timestamps
    end
    add_index :definitions, :name, unique: true
  end
end
