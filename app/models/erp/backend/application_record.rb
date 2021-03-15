module Erp
  module Backend
    class ApplicationRecord < ActiveRecord::Base # As Erp::ApplicationRecord
      self.abstract_class = true
    end

  end
end
