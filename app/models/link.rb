class Link < ActiveRecord::Base

  belongs_to :board

  attr_accessible :title, :url, :about

  validates_presence_of :title, :url

  default_scope :order => 'id DESC'

end
