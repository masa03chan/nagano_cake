class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_admin_path
    when Customer
      public_top_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :Customer
        public_top_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        root_path
    end
  end

end
