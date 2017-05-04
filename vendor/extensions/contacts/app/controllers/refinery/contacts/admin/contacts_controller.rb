module Refinery
  module Contacts
    module Admin
      class ContactsController < ::Refinery::AdminController

        crudify :'refinery/contacts/contact',
                :title_attribute => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def contact_params
          params.require(:contact).permit(:name, :mail_address, :subject, :message)
        end
      end
    end
  end
end
