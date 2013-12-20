class SubsController < ApplicationController
  include SessionsHelper
  def new
    @sub = Sub.new
     5.times { @sub.links.build }
  end

  def create
    attrs = params[:sub][:links_attributes]

    attrs.values.map! do |link_attrs|
      link_attrs[:user_id] = current_user.id
    end

    @sub = Sub.new(params[:sub])
    @sub.mod_id = current_user.id
    okay_links = attrs.select do |key, hash|
      hash.values.all? { |value| value != "" }
    end
    link_objs = []
    okay_links.each do |key, hash|
      link_objs << Link.new(hash)
    end
    @sub.links = link_objs

    # @sub.links.new(okay_links.values)
    p @sub.links

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
