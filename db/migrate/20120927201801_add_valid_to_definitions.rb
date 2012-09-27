class AddValidToDefinitions < ActiveRecord::Migration
  def change
    add_column :definitions, :dangerous, :boolean, default: true
  end
end
