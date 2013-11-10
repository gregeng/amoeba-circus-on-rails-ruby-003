class AmoebasController < ApplicationController
  before_action :set_amoeba, only: [:show, :edit, :update, :destroy]

  def index
    @amoebas = Amoeba.all
  end

  # GET /amoebas/1
  def show
  end

  # GET /amoebas/new
  def new
    @amoeba = Amoeba.new
  end

  # GET /amoebas/1/edit
  def edit
  end

  # GET /amoebas/1/split_new
  def split_new
    @amoeba  = Amoeba.new
    @amoeba2 = Amoeba.new
  end

  # POST /amoebas  ### I probably need to come up with some inheritance logic in the params, as well as the destroying of the parent amoeba
  def split_create
    @amoeba  = Amoeba.new(amoeba_params)
    @amoeba2 = Amoeba.new(amoeba_params)

    if @amoeba.save && @amoeba2.save
      redirect_to amoebas_path
    else
      "Error!"
    end
  end



  # Amoeba /amoebas
  def create
    @amoeba = Amoeba.new(amoeba_params)

    if @amoeba.save
      redirect_to @amoeba
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /amoebas/1
  def update
    if @amoeba.update(amoeba_params)
      redirect_to @amoeba
    else
      render action: 'edit'
    end
  end

  # DELETE /amoebas/1
  def destroy
    @amoeba.destroy

    redirect_to amoebas_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_amoeba
      @amoeba = Amoeba.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def amoeba_params
      params.require(:amoeba).permit(:name, :talent_id, :generation)
    end
end

