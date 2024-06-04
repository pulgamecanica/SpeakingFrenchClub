class IntraAuthController < ApplicationController
  def ft_auth
    redirect_to "https://api.intra.42.fr/oauth/authorize?client_id=#{ENV['FT_CLIENT']}&redirect_uri=#{ENV['FT_CALLBACK']}&response_type=code", allow_other_host: true
  end
  
  def auth
  end

  def auth_callback
    notice = ""
    begin
      client = OAuth2::Client.new(ENV['FT_CLIENT'], ENV['FT_SECRET'], site: "https://api.intra.42.fr")
      client.auth_code.authorize_url(:redirect_uri => ENV['FT_REDIRECT'])
      token = client.auth_code.get_token(params[:code], :redirect_uri => ENV['FT_CALLBACK_FORMATED'])
      response = token.get("/v2/me")
      @user = User.find_or_create_by(intra_id: response.parsed["id"]) do |user|
        user.email = response.parsed["email"]
        user.intra_profile_url = response.parsed["url"]
        user.intra_profile_image_url = response.parsed["image"]["versions"]["small"]
        user.intra_user = response.parsed["login"]
        user.intra_name = response.parsed["first_name"]
        user.nickname = response.parsed["login"]
      end
      puts @user
      if @user.persisted?
        sign_in @user, event: :authentication
      else
        session["devise.access_code"] = params[:code]
        return redirect_to new_user_session_path
      end
    rescue
      notice = "something went wrong with API connection... :("
    end
    redirect_to root_path, notice: notice
  end
end
