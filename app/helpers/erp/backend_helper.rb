module Erp
  module BackendHelper

    def check_controller_action(controller: "", action: "")
      if params[:controller] == controller && params[:action] == action
        return true
      else
        return false
      end
    end

    def profile_avatar(profile:)
      if profile.avatar.present?
        return profile.avatar
      else
        return '/backend/assets/img/default/default-user.png'
      end
    end


  end
end