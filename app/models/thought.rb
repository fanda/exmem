class Thought < ActiveRecord::Base

  belongs_to :board

  attr_accessible :text, :public

  validates_presence_of :text

  default_scope :order => 'id DESC'


  def text=(t)
    super BlueCloth.new(t).to_html
  end

end
