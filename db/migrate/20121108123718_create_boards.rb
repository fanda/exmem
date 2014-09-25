class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string  :name
      t.text    :pref_columns
      t.text    :pref_colours
      t.string  :pref_boxstyle, :limit => '20'
      t.references :user
      t.timestamps
    end
    add_attachment :boards, :background
  end
end
