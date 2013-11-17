class ActsController < ApplicationController

  def index
    @acts = Act.all
  end

  def show
    @act = Act.find(params[:id])
    @amoebas = Amoeba.all
  end

  def new
    @amoebas = Amoeba.all
    @act = Act.new
  end

  def create
    amoeba_ids = params[:acts][:amoebas]
    amoeba_objects = Amoeba.find_amoebas(amoeba_ids)
    date = params[:act]
    time = params[:act]

    @act = Act.new
    @act.name = params[:act][:name]
    @act.time = time["time(1i)"]+"-"+time["time(2i)"]+"-"+time["time(3i)"]+" "+time["time(4i)"]+":"+time["time(5i)"]
    @act.date = date["date(1i)"]+"-"+date["date(2i)"]+"-"+date["date(3i)"]
    @act.amoebas = amoeba_objects

    if @act.save
      redirect_to @act
    else
      render action: 'new'
    end
  end

  def edit
    @amoebas = Amoeba.all
    @act = Act.find(params[:id])
  end

  def update
    amoeba_ids = params[:acts][:amoebas]
    amoeba_objects = Amoeba.find_amoebas(amoeba_ids)
    date = params[:act]
    time = params[:act]

    @act = Act.find(params[:act][:id])
    @act.name = params[:act][:name]
    @act.time = time["time(1i)"]+"-"+time["time(2i)"]+"-"+time["time(3i)"]+" "+time["time(4i)"]+":"+time["time(5i)"]
    @act.date = date["date(1i)"]+"-"+date["date(2i)"]+"-"+date["date(3i)"]
    @act.amoebas = amoeba_objects

    if @act.save
      redirect_to @act
    else
      render action: 'edit'
    end
  end


  def destroy
    @act.destroy

    redirect_to acts_url
  end

  def ajax
    Rails.logger.info("PARAMS: #{params.inspect}")
    # {"tasks"=>{"0"=>{"task_id"=>"2"}, "1"=>{"task_id"=>"1"}, "2"=>{"task_id"=>"3"}}}

    # {"amoebas"=>{"1"=>{"amoeba_id"=>"1"}, "2"=>{"amoeba_id"=>"1"}, "3"=>{"amoeba_id"=>"3"}}, "controller"=>"acts", "action"=>"ajax"}
    @act = Act.all.find(params[:act_id])

    params[:amoebas].each do |index, amoeba|
      amoeba = Amoeba.all.find(amoeba[:amoeba_id])
      @act.amoebas << amoeba if !@act.amoebas.include?(amoeba)
    end

    all_amoebas = @act.amoebas
    render :json => all_amoebas

  end



  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def act_params
      params.require(:act).permit(:name, :date, :time, :amoebas)
    end

end
