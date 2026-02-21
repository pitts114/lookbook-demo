class ModalsController < ApplicationController
  layout false

  def show
    @modal_id = params[:id]
    @title = params[:title] || @modal_id.titleize
    @size = (params[:size] || :md).to_sym
  end
end
