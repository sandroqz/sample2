class AddressesController < ApplicationController
  before_filter :load_user

  def index
    @addresses = @user.addresses
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @addresses }
    end
  end

  def show
    @address = @user.addresses.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @address }
    end
  end

  def new
    @address = @user.addresses.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @address }
    end
  end

  def edit
    @address = @user.addresses.find(params[:id])
  end

  def create
    @address = @user.addresses.build(params[:address])
    respond_to do |format|
      if @address.save
        format.html { redirect_to user_address_path(@user, @address), notice: 'Address was successfully created.' }
        format.json { render json: @address, status: :created, location: user_address_path(@user, @address) }
      else
        format.html { render action: "new" }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @address = @user.addresses.find(params[:id])
    respond_to do |format|
      if @address.update_attributes(params[:address])
        format.html { redirect_to user_address_path(@user, @address), notice: 'Address was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @address = @user.addresses.find(params[:id])
    @address.destroy
    respond_to do |format|
      format.html { redirect_to user_addresses_url(@user) }
      format.json { head :ok }
    end
  end

  private
  def load_user
    @user = User.find params[:user_id]
  end
end
