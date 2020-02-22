# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      flash[:success] = 'ログインしました。'
      log_in user
      redirect_back_or user
    else
      flash.now[:danger] = 'メールアドレスかパスワードが間違っているようです。'
      render 'new'
    end
  end

  def destroy
    flash[:success] = 'ログアウトしました。'
    log_out
    redirect_to root_url
  end
end
