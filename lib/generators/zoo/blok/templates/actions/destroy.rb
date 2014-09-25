  def destroy
    @<%= instance_name %> = current_user.<%= instances_name %>.find(params[:id])
    @<%= instance_name %>.destroy
    render :text => 'ok'
  end
