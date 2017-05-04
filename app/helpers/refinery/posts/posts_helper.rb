module Refinery
  module Posts
    module PostsHelper
      def width_klass_by_image_aspect_retio(is_horizon_image)
        is_horizon_image ? 'grid2' : 'grid1'
      end
    end
  end
end
