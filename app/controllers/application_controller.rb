class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_cart
    if current_user
      if current_user.current_cart
        cart = current_user.current_cart 
        return cart 
      end
    end
  end
  
end
