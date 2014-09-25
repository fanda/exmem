class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.string :title
      t.string :url
      t.text :about
      t.timestamps
      t.references :board
    end
  end

  def self.down
    drop_table :links
  end
end
