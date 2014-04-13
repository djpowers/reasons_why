class ListsController < ApplicationController

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

  end

  def edit
    @list = List.find(params[:id])
    @reason = Reason.new
    @reasons = Reason.where(list_id: @list.id)
  end

  private

    def list_params
      params.require(:list).permit(:title, :subject_a, :subject_b, :adjective)
    end

end
