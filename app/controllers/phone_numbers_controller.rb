class PhoneNumbersController < ApplicationController

  before_filter :authenticate_user!

  def create
    @phone_number = board.phone_numbers.build(params[:phone_number])
    if @phone_number.save
      render :text => @phone_number.id
    else
      render :js => 'alert("Not successful")'
    end
  end

  def update
    @phone_number = board.phone_numbers.find(params[:id])
    if @phone_number.update_attributes(params[:phone_number])
      render :head => :ok
    else
      render :js => 'alert("Not successful")'
    end
  end

  def destroy
    @phone_number = board.phone_numbers.find(params[:id])
    @phone_number.destroy
    render :head => :ok
  end
end
