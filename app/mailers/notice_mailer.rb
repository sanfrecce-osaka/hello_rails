class NoticeMailer < ApplicationMailer
  def notify_posting_comment(params)
    @params = params
    mail to: 'admin@example.com', subject: '新しいコメントが投稿されました'
  end
end
