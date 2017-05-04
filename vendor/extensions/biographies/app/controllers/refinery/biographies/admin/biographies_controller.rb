module Refinery
  module Biographies
    module Admin
      class BiographiesController < ::Refinery::AdminController

        crudify :'refinery/biographies/biography',
                :title_attribute => 'content'

        private

        # Only allow a trusted parameter "white list" through.
        def biography_params
          params.require(:biography).permit(:content, :image_id)
        end
      end
    end
  end
end
