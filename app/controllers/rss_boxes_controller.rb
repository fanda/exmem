class RssBoxesController < ApplicationController

  before_filter :authenticate_user!

  def create
    @rss_box = board.rss_boxes.build(params[:rss_box])
    if @rss_box.save
      render :text => @rss_box.id
    else
      render :js => 'alert("Not successful")'
    end
  end

  def update
    @rss_box = board.rss_boxes.find(params[:id])
    if @rss_box.update_attributes(params[:rss_box])
      render :text => 'ok'
      #render :head => :ok
    else
      render :js => 'alert("Not successful")'
    end
  end

  def destroy
    @rss_box = board.rss_boxes.find(params[:id])
    @rss_box.destroy
    render :text => 'ok'
  end
end
