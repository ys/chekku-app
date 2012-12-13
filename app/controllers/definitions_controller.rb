class DefinitionsController < ApplicationController

  respond_to :html, :json
  respond_to :yaml, only: [:index, :show, :export]

  helper_method :definition
  helper_method :definitions
  helper_method :q

  before_filter :authenticate_user!, except: [:index, :export]

  before_filter :set_tags, only: [:new, :create, :edit, :update]

  def index
  end

  def export
    respond_to do |with|
      with.html
      with.yaml do
        definitions_with_updated_at = [{ 'updated_at' => Date.today }] + definitions.safe.map{ |definition| YamlDefinition.new(definition).output }
        render text: definitions_with_updated_at.to_yaml
      end
    end
  end

  def new
  end

  def create
    definition.user = current_user
    definition.save
    respond_with definition, location: definitions_path
  end

  def show
  end

  def edit
  end

  def update
    definition.update_attributes(definition_params)
    respond_with definition
  end

  private

  def definition
    @definition ||= if params[:id]
      Definition.find_by_name(params[:id])
      elsif params[:definition]
        Definition.new(definition_params)
      else
        Definition.new
      end
  end

  def definitions
    @definitions ||= query ? Definition.search(query) : Definition.scoped
  end

  def q
    params[:q]
  end

  def query
    if q.present?
      q.gsub('OR', '|')
    elsif params[:definitions]
      params[:definitions].join(' | ')
    else
      nil
    end
  end

  def definition_params
    if current_user.admin?
      params.require(:definition).permit(:executable, :name, :tags_list, :dangerous)
    else
      params.require(:definition).permit(:executable, :name, :tags_list)
      params[:definition][:dangerous] = true
    end
  end

  def set_tags
    @tags = Tag.all
  end
end
