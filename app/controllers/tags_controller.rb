class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    flash.notice = "New tag created"
    redirect_to tags_path
  end

  def destroy
    @tag = Tag.find(params[:id])
    if @tag.destroy
    flash.notice = "Tag '#{@tag.name}' destroyed!"
    redirect_to tags_path
    end
  end

  private

  def comment_params
    params.require(:tag).permit(:name)
  end
end
