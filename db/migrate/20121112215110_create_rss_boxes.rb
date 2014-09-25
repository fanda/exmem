class CreateRssBoxes < ActiveRecord::Migration
  def change
    create_table :rss_boxes do |t|
      t.string  :key
      t.string  :title
      t.string  :url
      t.text    :feeds

      t.references :board
      t.timestamps
    end
    add_index :rss_boxes, :key
  end
end
