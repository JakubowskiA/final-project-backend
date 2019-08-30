class EntriesController < ApplicationController
  def show
    #  .where(:user_id => user.id)
    byebug
    entry_date = request.headers["Entry-Date"].to_date()
    user_id = request.headers["User-Id"]
    byebug
    # user_entries = Entry.find_by(user_id: user_id).where(:user_id => user_id)
    user_entries = Entry.created_on(entry_date).select do |entry|
      entry.user_id == params[:user_id].to_i
    end
    # user_entries = Entry.find_by(created_at: date + 1).where(:user_id => user_id)
    # THE ONE BELOW WORKS
    # user_entries = Entry.find_by(user_id: params[:user_id])
    # # user_entries = Entry.find_by(user_id: params[:user_id], created_at: date - 1)
    # date_entries = Entry.find_by(created_at: entry_date + 1)
    # byebug
    # if entry.nil?
    #   render json: {}
    # else
    #   render json: user_entries
    # end
    render json: user_entries
  end

  def create
    new_entry = Entry.create(entry_params)
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
    # params.require(:entry).permit(:pre_level, :stressors, :evaluation, :action, :positivity, :post_level, :user_id)
  end
end
