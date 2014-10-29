module SessionHelper
  def login_admin
    login(create(:user, admin: true))
  end

  def login(user)
    request.session[:user_id] = user.id
    controller.current_user
  end
end
