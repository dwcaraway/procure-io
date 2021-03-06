class GodController < ApplicationController
  before_filter :authenticate_god!
  protect_from_forgery except: [:login_as]

  def login_as
    find_user_by_id_or_email

    if @user
      sign_in @user
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  private
  def find_user_by_id_or_email
    if params[:id_or_email].to_i > 0
      @user = User.where(id: params[:id_or_email].to_i).first
    else
      @user = User.where(email: params[:id_or_email]).first
    end
  end
end