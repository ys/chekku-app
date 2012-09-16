class DefinitionsController < ApplicationController

  respond_to :html, :json

  helper_method :definition
  helper_method :definitions

  skip_before_filter :authenticate_user!, only: :index

  def index
  end

  def new
  end

  def create
    definition.user = current_user
    definition.save
    respond_with definition
  end

  def show
  end

  private

  def definition
    @definition ||= params[:id] ? Definition.find(params[:id]) : Definition.new(definition_params)
  end

  def definitions
    @definitions ||= params[:q] ? Definition.search(params[:q]) : Definition.all
  end

  def definition_params
    params[:definition]
  end
end
