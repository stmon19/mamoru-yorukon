module Refinery
  module Works
    module Admin
      class WorksController < ::Refinery::AdminController

        crudify :'refinery/works/work'

        private

        # Only allow a trusted parameter "white list" through.
        def work_params
          params.require(:work).permit(:title, :image_id, :description, :material, :width, :depth, :height, :finished_at)
        end
      end
    end
  end
end
