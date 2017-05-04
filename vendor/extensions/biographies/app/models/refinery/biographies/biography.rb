module Refinery
  module Biographies
    class Biography < Refinery::Core::BaseModel
      self.table_name = 'refinery_biographies'


      validates_presence_of :content

      belongs_to :image, :class_name => '::Refinery::Image'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]
      scope :newest, -> { order(updated_at: :desc).limit(1) }
    end
  end
end
