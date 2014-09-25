class AbstractBox < ActiveRecord::Base

  self.abstract_class = true
  @columns = []

  attr_accessible :key

  belongs_to :board

end
