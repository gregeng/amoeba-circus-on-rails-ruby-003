class ActsController < ApplicationController

  def index
    @acts = Act.all
  end

  def show
    @act = Act.find(params[:id])
  end

  def new
    @amoebas = Amoeba.all
    @act = Act.new
  end



end
