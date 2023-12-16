# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
 before_action :player_state, only: [:create]
   # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
   def guest_sign_in
    player = Player.guest
    sign_in player
    redirect_to public_top_path, notice: 'ゲストユーザーとしてログインしました。'
   end

   protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

   def after_sign_in_path_for(resource)
    public_top_path
   end
   
   def after_sign_out_path_for(resource)
    new_player_session_path
   end
   
   def player_state
    player = Player.find_by(email: params[:player][:email])
    return if player.nil?
    return unless player.valid_password?(params[:player][:password])
    return if player.is_active
    flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
    redirect_to new_player_registration_path
   end
end
