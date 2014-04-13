class ListsController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :edit]

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id

    if @list.save
      flash[:success] = 'List was successfully created.'
      redirect_to @list
    else
      render 'new'
    end
  end

  def show
    @list = List.find(params[:id])
    @reasons = @list.reasons.map(&:body)
  end

  def edit
    @list = List.find(params[:id])
    @reason = Reason.new
    @reasons = @list.reasons
  end

  def index
    @lists = List.where(user_id: current_user.id) if user_signed_in?
  end

  private

    def list_params
      params.require(:list).permit(:title, :subject_a, :subject_b, :adjective)
    end

end
