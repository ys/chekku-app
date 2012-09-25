class DefinitionsController < ApplicationController

  respond_to :html, :json
  respond_to :yaml, only: [:index, :show]

  helper_method :definition
  helper_method :definitions

  skip_before_filter :authenticate_user!, only: [:index, :export]

  def index
  end

  def export
    respond_to do |with|
      with.html
      with.yaml { render text: definitions.map{ |definition| YamlDefinition.new(definition).output }.to_yaml }
    end
  end

  def new
  end

  def create
    definition.user = current_user
    definition.save
    respond_with definition, redirect_url: definitions_path
  end

  def show
  end

  private

  def definition
    @definition ||= params[:id] ? Definition.find(params[:id]) : Definition.new(definition_params)
  end

  def definitions
    @definitions ||= query ? Definition.search(query) : Definition.all
  end

  def query
    if params[:q]
      params[:q].gsub('OR', '|')
    elsif params[:definitions]
      params[:definitions].join(' | ')
    else
      nil
    end
  end

  def definition_params
    params[:definition]
  end
end
