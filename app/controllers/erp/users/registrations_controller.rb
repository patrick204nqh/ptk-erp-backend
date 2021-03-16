module Erp
  module Users
    class RegistrationsController < Devise::RegistrationsController
      layout :set_layout

      # POST /resource
      def create
        params = sign_up_params
        params[:role_id] = Erp::UserRole.find_by(name: "#{Erp::UserRole::ROLE_AS_DEFAULT}").id # Default role for new user signup => just admin change role for users
        build_resource(params)
        if resource.save
          Erp::UserProfile.create(user_id: resource.id) # Auto create profile for new user
        end
        yield resource if block_given?
        if resource.persisted?
          if resource.active_for_authentication?
            set_flash_message! :notice, :signed_up
            sign_up(resource_name, resource)
            respond_with resource, location: after_sign_up_path_for(resource)
          else
            set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
            expire_data_after_sign_in!
            # Custom here
            # respond_with resource, location: after_inactive_sign_up_path_for(resource)
            render plain: '<h2><i class="fa fa-user" aria-hidden="true"></i> Tạo tài khoản thành công</h2><p>Một email đã được gửi tới bạn với hướng dẫn xác minh tài khoản. Vui lòng kiểm tra email.</p>'
          end
        else
          clean_up_passwords resource
          set_minimum_password_length
          respond_with resource
        end
      end

      private

      def sign_up_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :role_id)
      end

      def account_update_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
      end

      private
        def set_layout
          return nil if request.xhr?

          if session[:current_view] == 'frontend'
            "erp/frontend/auth"
          else
            "erp/backend/auth"
          end
        end
    end
  end
end
