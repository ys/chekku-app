class AddTagsToDefinitions < ActiveRecord::Migration
  def change
    add_column :definitions, :tags, :string, :array => true
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end
  end
end
