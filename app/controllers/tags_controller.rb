class TagsController < ApplicationController

  def show
    @tag = Tag.find_by_name(params[:id])
    @definitions = Definition.with_tag(params[:id])
  end
end
