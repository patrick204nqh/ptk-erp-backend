module Erp
  class ApplicationController < ActionController::Base
    include Pundit # from 'app/policies'

    protect_from_forgery with: :exception

  end
end
