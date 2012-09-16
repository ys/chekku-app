class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :uid
      t.string :provider
      t.string :avatar_url
      t.string :name

      t.timestamps
    end
  end
end
