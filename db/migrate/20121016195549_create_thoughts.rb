class CreateThoughts < ActiveRecord::Migration
  def self.up
    create_table :thoughts do |t|
      t.text :text
      t.boolean :public
      t.timestamps
      t.references :board
    end
  end

  def self.down
    drop_table :thoughts
  end
end
