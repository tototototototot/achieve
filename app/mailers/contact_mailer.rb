class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.sendmail_contacts.subject
  #
  def sendmail_contacts(contacts)
    @contacts = contacts

    mail to: "taka-t@nttpc.co.jp",
			subject: '【Achieve】お問い合わせが投稿されました'
			

  end
end
