class EntriesController < ApplicationController
  def show
    entry = Entry.find_by(user_id: params[:user_id])
    if entry.nil?
      render json: {}
    else
      render json: entry.fetch_book_info
    end
  end

  def create
    new_entry = Entry.create(user_id: params[:user_id])
    render json: new_entry.fetch_book_info
  end

  def destroy
    entry = Entry.find_by(user_id: params[:user_id], book_id: params[:book_id])
    entry.destroy
    render json: {}
  end

  private

  def entry_params
    params.require(:entry).permit()
  end
end
