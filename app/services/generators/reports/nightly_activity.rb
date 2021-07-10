# frozen_string_literal: true

module Generators
  module Reports
    class NightlyActivity
      BEGINNING_OF_NIGHT = DateTime.now.yesterday.midday + 6.hours
      END_OF_NIGHT = DateTime.now.midnight + 7.hours
    
      def generate!
        {
          processed_licenses: License.where(created_at: BEGINNING_OF_NIGHT..END_OF_NIGHT)
        }
      end
    end
  end
end
