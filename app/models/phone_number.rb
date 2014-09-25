class PhoneNumber < ActiveRecord::Base

  belongs_to :board

  attr_accessible :name, :number

  validates_presence_of :name, :number

  default_scope :order => 'id DESC'

end
