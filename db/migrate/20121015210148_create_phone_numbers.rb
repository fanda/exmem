class CreatePhoneNumbers < ActiveRecord::Migration
  def self.up
    create_table :phone_numbers do |t|
      t.string :name
      t.string :number
      t.timestamps
      t.references :board
    end
  end

  def self.down
    drop_table :phone_numbers
  end
end
