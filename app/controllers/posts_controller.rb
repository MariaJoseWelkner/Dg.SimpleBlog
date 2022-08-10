class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def create
    @post = Post.create(title: params[:title],image_url: params[:image_url], content: params[:content])
    @post = Post.new(post_params)
    @post.content = @post.content.gsub("spoiler", "")
    if @post.save 
      redirect_to root_path, notice: "Post creado exitosamente"
    end
  end

  # def create
  #   @post = Post.new(post_params)
  #   @post.content = @post.content.gsub("spoiler", "")
  #   if @post.save
  #     redirect_to posts_path, notice: "Post was created successfully."
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  def show
  end

  # def post_params
  #   params.require(:post).permit(:title, :content, :image_url)
  # end



end
