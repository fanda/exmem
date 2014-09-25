  def create
    @<%= instance_name %> = current_user.<%= instances_name %>.build(params[:<%= instance_name %>])
    if @<%= instance_name %>.save
      render :text => @<%= instance_name %>.id
    else
      render :js => 'alert("Not successful")'
    end
  end
