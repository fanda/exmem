class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :user_signed_in?

  private

    def board
      return @board if defined? @board
      if bo = cookies[:bo]
        if board = current_user.boards.where(:id => bo)
          return @board = board.first
        end
      end
      @board = current_user.boards.first
      cookies[:bo] = @board.id
      return @board
    end

    def set_locale
      @locale = if params[:l]
        cookies[:l] = params[:l]
      else
        cookies[:l]|| I18n.default_locale
      end
      I18n.locale = @locale
    end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def user_signed_in?
      return true if current_user
    end

    def authenticate_user!
      if !current_user
        flash[:error] = 'You need to sign in before accessing this page!'
        redirect_to signin_services_path
      end
    end
end
