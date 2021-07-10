# frozen_string_literal: true

module Generators
  module PDF
    class NightlyActivityReport
      def initialize(report)
        @report = report
      end

      def generate!
        pdf_html = ActionController::Base.new.render_to_string(
          template: 'company_mailer/nightly_activity_report_pdf.html.erb',
          layout: 'mailer.html.erb',
          locals: { :@report => @report }
        )
        WickedPdf.new.pdf_from_string(pdf_html)
      end
    end
  end
end