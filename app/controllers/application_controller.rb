class ApplicationController < ActionController::Base
  protect_from_forgery

 # before_filter :check_logined

  private
  def check_logined
    if session[:usr] then
      begin
        @usr = Team.find(session[:usr])
      rescue ActiveRecord::RecordNotFound
        reset_session
      end
    end
    unless @usr
      flash[:referer] = request.fullpath
      redirect_to :controller => 'login', :action => 'index'
    end
  end
end
