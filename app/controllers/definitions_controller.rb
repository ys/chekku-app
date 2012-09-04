class DefinitionsController < ApplicationController

  helper_method :definition

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  private
  def definition
    Definition.new
  end

end
