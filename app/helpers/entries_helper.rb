module EntriesHelper
  def approved_comment?(comment)
    comment.status == 'approved'
  end
end
