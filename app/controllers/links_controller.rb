class LinksController < ApplicationController

  before_filter :authenticate_user!

  def create
    @link = board.links.build(params[:link])
    if @link.save
      render :text => @link.id
    else
      render :js => 'alert("Not successful")'
    end
  end

  def update
    @link = board.links.find(params[:id])
    if @link.update_attributes(params[:link])
      render :head => :ok
    else
      render :js => 'alert("Not successful")'
    end
  end

  def destroy
    @link = board.links.find(params[:id])
    @link.destroy
    render :head => :ok
  end

end
