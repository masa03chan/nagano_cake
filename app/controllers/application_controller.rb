class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_admin_path
    when Customer
      public_top_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when Admin
      '/admin/sign_in'
    when Customer
      public_root_path
    end
  end

end
