module SessionsHelper
  def sign_in(user)
    session[:id] = user.id
    @current_user = user
  end

  def sign_out
    session.delete :id
  end

  def current_user
    return nil unless session[:id]
    @current_user ||= User.find_by(id: session[:id])
  rescue Mongoid::Errors::DocumentNotFound
    nil
  end

  def current_user?(user)
    user == current_user
  end

  def check_user_signed_in
    if current_user.nil?
      redirect_to sign_in_path, notice: 'Please sign in'
    end
  end
end
