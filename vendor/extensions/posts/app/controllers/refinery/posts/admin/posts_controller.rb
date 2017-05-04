module Refinery
  module Posts
    module Admin
      class PostsController < ::Refinery::AdminController

        crudify :'refinery/posts/post'

        private

        # Only allow a trusted parameter "white list" through.
        def post_params
          params.require(:post).permit(:title, :image_id, :description, :event_start_at, :event_end_at, :venue)
        end
      end
    end
  end
end
