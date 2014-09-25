class BoardController < ApplicationController

  before_filter :authenticate_user!

  def show
    cookies[:bo] = params[:id]
    redirect_to show_edit_path
  end

  def create
    if bo = current_user.boards.create({:name => params[:name]})
      cookies[:bo] = bo.id
      head :ok
    else
      head :error
    end
  end

  def destroy
    board = current_user.boards.find_by_id cookies[:bo]
    if board.destroy
      cookies[:bo] = current_user.board_ids.first
      render :js => 'window.location.href = "!"'
    else
      render :js => 'alert("Cannot remove board");'
    end
  end

  def save_columns
    board.update_preference(:columns, params[:columns])
    render :text => 'ok', :status => :ok
  end

  def save_colours
    board.pref_colours[params[:column]] = params[:colour]
    board.save
    render :text => 'ok', :status => :ok
  end

  def add_box
    render :partial => '/facebox/addbox'
  end

end
