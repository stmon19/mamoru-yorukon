module Refinery
  module Contacts
    class Contact < Refinery::Core::BaseModel
      self.table_name = 'refinery_contacts'


      validates_presence_of :name, :mail_address, :message

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
