module Refinery
  module Biographies
    class BiographiesController < ::ApplicationController

      before_action :find_page

      def show
        @biography = Biography.newest.first

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @biography in the line below:
        present(@page)
      end

    protected

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/biographies").first
      end

    end
  end
end
