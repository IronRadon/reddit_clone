class SubsController < ApplicationController
  include SessionsHelper
  def new
    @sub = Sub.new
    5.times { @sub.links.build }
  end

  def create
    params[:sub][:links_attributes].values.map do |link_attrs|
      link_attrs[:user_id] = current_user.id
    end
    @sub = Sub.new(params[:sub])
    @sub.mod_id = current_user.id
    @sub.links.new(params[:sub][:links_attributes].values)

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to new_sub_url
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update_attributes(params[:sub])
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def show
    @sub = Sub.find(params[:id])
    @links = @sub.links
  end

  def destroy
    @sub = Sub.find(params[:id])
    @sub.destroy unless @sub.nil?
    redirect_to new_sub_url
  end
end
