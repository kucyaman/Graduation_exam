class UserSessionsController < ApplicationController
  require 'googleauth/id_tokens/verifier'
  skip_before_action :require_login, only: %i[callback]

  protect_from_forgery except: :callback
  before_action :verify_g_csrf_token, except: :destroy

  def callback
    client_id = Rails.application.credentials.dig(:google, :google_client_id)
    payload = Google::Auth::IDTokens.verify_oidc(params[:credential], aud: client_id)
    user = User.find_or_create_by(email: payload['email'])
    session[:user_id] = user.id
    redirect_to books_path
    flash[:success] = "ログインしました"
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
    flash[:success] = "ログアウトしました"
  end

  private

  def verify_g_csrf_token
    if cookies["g_csrf_token"].blank? || params[:g_csrf_token].blank? || cookies["g_csrf_token"] != params[:g_csrf_token]
      redirect_to root_path
      flash[:danger] = "不正なアクセスです"
    end
  end
end
