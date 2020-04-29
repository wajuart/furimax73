class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day])
  end

  # def birth_day_join
  #   # パラメータ取得
  #   date = params[:user][:birth_day]

  #   # ブランク時のエラー回避のため、ブランクだったら何もしない
  #   if date["birth_day(1i)"].empty? && date["birth_day(2i)"].empty? && date["birth_day(3i)"].empty?
  #     return
  #   end

  #   # 年月日別々できたものを結合して新しいDate型変数を作って返す
  #   Date.new date["birth_day(1i)"].to_i,date["birth_day(2i)"].to_i,date["birth_day(3i)"].to_i
  # end
end
