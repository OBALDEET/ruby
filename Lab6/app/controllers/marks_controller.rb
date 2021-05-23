class MarksController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @mark = @post.marks.create(mark_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @mark = @post.marks.find(params[:id])
    @mark.destroy
    redirect_to post_path(@post)
  end

  private def mark_params
      params.require(:mark).permit(:points)
  end
end