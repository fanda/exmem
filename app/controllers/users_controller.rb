class UsersController < ApplicationController

  before_filter :authenticate_user!, :only => [:show_edit]

  before_filter :set_locale, :only => [:show, :show_edit]

  def show
    @user = User.find_by_name params[:name]
    @links = board.links
    @phone_numbers = board.phone_numbers
    @thoughts = board.thoughts
    @rss_box = board.rss_boxes.first
  end

  def show_edit
    if params[:name]
      redirect_to '/!' and return unless current_user.name == params[:name]
    end
    @links = board.links
    @link = Link.new
    @phone_numbers = board.phone_numbers
    @phone_number = PhoneNumber.new
    @thoughts = board.thoughts
    @thought = Thought.new
    @rss_box = board.rss_boxes.first
    render :template => '/main/index'
  end

end
