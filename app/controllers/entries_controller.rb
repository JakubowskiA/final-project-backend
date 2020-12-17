class EntriesController < ApplicationController
  def show
    #  .where(:user_id => user.id)
    # byebug
    entry_date = request.headers["Entry-Date"].to_date()
    user_id = request.headers["User-Id"]
    # byebug
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

  def get_stress_level_data
    entries = Entry.select do |entry|
      entry.user_id == params[:user_id].to_i
    end

    # keys_to_extract = [:created_at, :pre_level]

    # pre_levels = entries.map do |hash|
    #   hash.select do |key, value|
    #     [:created_at, :pre_level].include? key
    #   end
    # end

    # entries.select { |key, _| keys_to_extract.include? key }

    # pre_levels = entries.each do |entry|
    #   entry.extract!(:created_at)
    # end

    # desired_keys_pre = [:created_at, :pre_level]

    # pre_levels = entries.each do |entry|
    #   entry.map do |entry|
    #     entry.select { |key, _| desired_keys_pre.include? key }
    #   end
    # end

    render json: entries
  end

  def get_stress_post_level_data
    user_entries = Entry.select do |entry|
      entry.user_id == params[:user_id].to_i
    end

    desired_keys_post = [:created_at, :post_level]

    post_levels = user_entries.select { |key, _| desired_keys_post.include? key }

    render json: post_levels
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
  end
end
