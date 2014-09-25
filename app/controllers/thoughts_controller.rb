class ThoughtsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @thought = board.thoughts.build(params[:thought])
    if @thought.save
      render :text => @thought.id
    else
      render :js => 'alert("Not successful")'
    end
  end

  def update
    @thought = board.thoughts.find(params[:id])
    if @thought.update_attributes(params[:thought])
      render :text => 'ok'
      #render :head => :ok
    else
      render :js => 'alert("Not successful")'
    end
  end

  def destroy
    @thought = board.thoughts.find(params[:id])
    @thought.destroy
    render :text => 'ok'
  end
end
