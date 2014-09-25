class AddOdorik < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string, :limit => 15
    create_table :odoriks do |t|
      t.string :uid, :limit => 11
      t.string :apik, :limit => 11
      t.string :line, :limit => 15
      t.references :user
      t.timestamps
    end
  end

end
