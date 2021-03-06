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
    @talents = Talent.all
    @acts = Act.all
  end

  # POST /amoebas
  def create
    ### I'm not sure how to mass assign when we have to use checkboxes.
    act_ids = params[:amoeba][:acts]
    act_objects = Act.find_acts(act_ids)

    @amoeba = Amoeba.new
    @amoeba.name = params[:amoeba][:name]
    @amoeba.talent = Talent.find(params[:amoeba][:talent])
    @amoeba.generation = params[:amoeba][:generation]
    @amoeba.acts = act_objects

    if @amoeba.save
      redirect_to @amoeba
    else
      render action: 'new'
    end
  end

  # GET /amoebas/1/edit
  def edit
    @talents = Talent.all
    @acts = Act.all
  end

  # GET /amoebas/:id/split_new
  def split_new
    @parent = Amoeba.find(params[:id])
    @acts = Act.all
    @amoeba  = Amoeba.new
    render template: "amoebas/split_new"
  end

  # POST /amoebas  ### I probably need to come up with some inheritance logic in the params, as well as the destroying of the parent amoeba
  def split_create
    @parent = Amoeba.find(params[:parent][:id])

    act_ids = params[:amoeba][:acts]
    act_objects = Act.find_acts(act_ids)

    @amoeba = Amoeba.new
    @amoeba.name = params[:amoeba][:name]
    @amoeba.talent = Talent.find(params[:amoeba][:talent])
    @amoeba.generation = params[:amoeba][:generation]
    @amoeba.acts = act_objects

    act_ids2 = params[:amoeba2][:acts]
    act_objects2 = Act.find_acts(act_ids2)

    @amoeba2 = Amoeba.new
    @amoeba2.name = params[:amoeba2][:name]
    @amoeba2.talent = Talent.find(params[:amoeba2][:talent])
    @amoeba2.generation = params[:amoeba2][:generation]
    @amoeba2.acts = act_objects2

    if @amoeba.save && @amoeba2.save
      @parent.destroy
      redirect_to amoebas_path
    else
      render text: "Error!"
    end
  end

  # PATCH/PUT /amoebas/1
  def update
    act_ids = params[:amoeba][:acts]
    act_objects = Act.find_acts(act_ids)

    @amoeba = Amoeba.find(params[:amoeba][:id])
    @amoeba.name = params[:amoeba][:name]
    @amoeba.talent = Talent.find(params[:amoeba][:talent])
    @amoeba.generation = params[:amoeba][:generation]
    @amoeba.acts = act_objects

    if @amoeba.save
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
      params.require(:amoeba, :amoeba2).permit(:name, :talent, :acts, :generation)
    end
end

