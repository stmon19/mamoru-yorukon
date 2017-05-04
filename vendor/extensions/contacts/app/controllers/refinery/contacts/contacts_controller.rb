module Refinery
  module Contacts
    class ContactsController < ::ApplicationController

      before_action :find_page

      def new
        @contact = Contact.new
        present(@page)
      end

      def create
        @contact = Contact.new(contact_params)
        if @contact.save
          ContactMailer.contact(name: @contact.name, mail_address: @contact.mail_address, subject: @contact.subject, message: @contact.message).deliver_now
          redirect_to refinery.new_contacts_contacts_url, notice: 'お問い合わせありがとうございます。メールを送信いたしました。'
        else
          render action: :new
        end
      end

    protected

      def contact_params
        params.require(:contact).permit(:name, :mail_address, :subject, :message)
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/contacts").first
      end

    end
  end
end
