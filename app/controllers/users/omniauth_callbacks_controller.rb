class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  def facebook
    oauth_sign_in("facebook")
  end

  def google_oauth2
    oauth_sign_in('google_oauth2')
  end

  protected

  def oauth_sign_in(strategy)
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user
    else
      session["devise.#{strategy}_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url(omniauth_strategy: strategy)
    end
  end

  # The path used when OmniAuth fails
  def after_omniauth_failure_path_for(scope)
    super(scope)
  end
end
