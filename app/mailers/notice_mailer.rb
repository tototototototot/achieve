class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmailblog.subject
  #
  def sendmail_blog(blog)
    @blog = blog

    mail to: "taka-t@nttpc.co.jp",
					subject: '【Achieve】ブログが投稿されました'

  end
end
