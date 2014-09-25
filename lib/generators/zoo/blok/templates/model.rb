class <%= class_name %> < ActiveRecord::Base

  belongs_to :user

<%= "  set_table_name :#{table_name}\n" if table_name -%>
  attr_accessible <%= model_attributes.map { |a| ":#{a.name}" }.join(", ") %>

  default_scope :order => 'id DESC'

end
