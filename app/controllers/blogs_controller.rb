class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit]

  def index
    @blogs = Blog.all
  end

  def show
    @entries = @blog.entries
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to @blog, notice: 'Blog was successfully created.'
    else
      render :new
    end
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title)
  end
end
