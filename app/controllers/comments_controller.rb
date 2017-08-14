class CommentsController < ApplicationController
  before_action :set_blog
  before_action :set_entry
  before_action :set_comment, except: :create

  def create
    @comment = Comment.new(comment_params)
    @comment.entry = @entry

    if @comment.save
      redirect_to [@blog, @entry], notice: 'Comment was successfully created.'
    else
      render 'entries/show'
    end
  end

  def approve
    if @comment.update(status: 'approved')
      redirect_to [@blog, @entry]
    else
      render 'entries/show'
    end
  end

  private
  def set_blog
    @blog = Blog.find(params[:blog_id])
  end

  def set_entry
    @entry = Entry.find(params[:entry_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
