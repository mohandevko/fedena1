class Devise::OmniauthController < Devise::OmniauthCallbacksController
  def facebook
    create
  end
  
  def google_apps
    create
  end
  
  def twitter
    create
  end
  
  def linked_in
    create
  end
  
  def create
    auth = request.env['omniauth.auth']
    unless @auth = Authorization.find_from_hash(auth)
      @auth = Authorization.create_from_hash(auth, current_user)
    end
    @user = @auth.user

    if @user.persisted?
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect @user, :event => :authentication
    else
      flash[:notice] = "Login failed."
      redirect_to new_user_registration_url
    end
  end
  
  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end
  
  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
end
