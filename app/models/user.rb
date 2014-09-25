class User < ActiveRecord::Base

  has_many :boards
  has_many :services
  has_one  :odorik

  attr_accessible :email, :name

  validates_uniqueness_of :email, :case_sensitive => false

  after_create :ensure_first_board

  def update_preference(name, data)
    self.update_attribute "pref_#{name}", data
  end

private

  def ensure_first_board
    self.boards.create!({ :name => I18n.t('main_board') })
  end

end
