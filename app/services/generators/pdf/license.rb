# frozen_string_literal: true

module Generators
  module PDF
    class License
      def initialize(license)
        @license = license
      end

      def generate!
        pdf_html = ActionController::Base.new.render_to_string(
          template: 'rider_mailer/pdf.html.erb',
          layout: 'mailer.html.erb',
          locals: { :@license => @license }
        )
        WickedPdf.new.pdf_from_string(pdf_html)
      end
    end
  end
end
