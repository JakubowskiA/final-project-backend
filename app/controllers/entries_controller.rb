class EntriesController < ApplicationController
  def show
    entry = Entry.find_by(entry_params)
    if entry.nil?
      render json: {}
    else
      render json: entry
    end
  end

  def create
    new_entry = Entry.create(user_id: params[:user_id])
    render json: new_entry
  end

  def destroy
    entry = Entry.find_by(user_id: params[:user_id], entry_id: params[:entry_id])
    entry.destroy
    render json: {}
  end

  private

  def entry_params
    params.require(:entry).permit(:pre_level, :stressors, :evaluation, :action, :positivity, :post_level, :user_id)
  end
end
