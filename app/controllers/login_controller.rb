#coding: utf-8

class LoginController < ApplicationController
  skip_before_filter :check_logined
  def index
    render 'index'
  end

  def auth
    usr = Team.authenticate(params[:name], params[:password])
    if usr then
      session[:usr] = usr.id
      redirect_to params[:referer]
    else
      flash.now[:referer] = params[:referer]
      @error = 'ユーザ名/パスワードが間違っています'
      render 'index'
    end
  end

  def logout
    reset_session
    redirect_to '/'
  end
end
