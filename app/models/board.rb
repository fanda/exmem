class Board < ActiveRecord::Base

  belongs_to :user

  has_many :links
  has_many :phone_numbers
  has_many :thoughts
  has_many :rss_boxes, :class_name => 'Rss'

  has_attached_file :background

  attr_accessible :name, :background

  serialize :pref_columns, Hash
  serialize :pref_colours, Hash


  validates_attachment :background,
  :content_type => { :content_type => "image/jpg" },
  :size => { :in => 0..5.megabytes }

  default_scope order('id ASC')

  before_destroy :never_destroy_main_board

  def update_preference(name, data)
    self.update_attribute "pref_#{name}", data
  end

  private

  def never_destroy_main_board
    if self == user.boards.first or self.id == 1
      return false
    end
    true
  end

end
