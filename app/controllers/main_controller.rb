class MainController < ApplicationController
  def index
    redirect_to '/!' if current_user
    @board = Board.first
    @links = @board.links
    @link = Link.new
    @phone_numbers = @board.phone_numbers
    @phone_number = PhoneNumber.new
    @thoughts = @board.thoughts
    @thought = Thought.new
  end
end
