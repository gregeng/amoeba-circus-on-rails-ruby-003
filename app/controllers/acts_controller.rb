class ActsController < ApplicationController

  def index
    @acts = Act.all
  end

  def show
    @act = Act.find(params[:id])
  end


end
