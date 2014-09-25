  def update
    @<%= instance_name %> = current_user.<%= instances_name %>.find(params[:id])
    if @<%= instance_name %>.update_attributes(params[:<%= instance_name %>])
      render :text => 'ok'
    else
      render :js => 'alert("Not successful")'
    end
  end
