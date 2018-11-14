class TalksController < ApplicationController
  before_action :set_talk, only: [:show, :edit, :update, :destroy]

  def index
    @talks = Talk.all
  end
  
  def new
    if params[:back]
      @talk = Talk.new(talk_params)
    else
      @talk = Talk.new
    end
  end
  
  def confirm
    @talk = Talk.new(talk_params)
    render :new if @talk.invalid?
  end
  
  def edit
    @talk = Talk.find(params[:id])
  end
  
  def create
    @talk = Talk.new(talk_params)
    if @talk.save
      redirect_to talks_path, notice:"Talk posted !"
    else
      render'new'
    end
  end
  
  def show
    @talk = Talk.find(params[:id])
  end
  
  def update
    @talk = Talk.find(params[:id])
    if @talk.update(talk_params)
      redirect_to talks_path, notice:'Talk updated !'
    else
      render'edit'
    end
  end
    
  def destroy
    @talk.destroy
    redirect_to talks_path, notice:'Talk destroyed！'
  end
  
  private
  
  def talk_params
    params.require(:talk).permit(:content)
  end
  
  def set_talk
    @talk = Talk.find(params[:id])
  end
end