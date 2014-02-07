class MerchantUsersController < ApplicationController

skip_before_filter :authenticate_user! 

  def index
    @merchant_users = MerchantUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @merchant_users }
    end
  end

  # GET /merchant_users/1
  # GET /merchant_users/1.json
  def show
    @merchant_user = MerchantUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @merchant_user }
    end
  end

  # GET /merchant_users/new
  # GET /merchant_users/new.json
  def new
    @merchant_user = MerchantUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @merchant_user }
    end
  end

  # GET /merchant_users/1/edit
  def edit
    @merchant_user = MerchantUser.find(params[:id])
  end

  # POST /merchant_users
  # POST /merchant_users.json
  def create
    @merchant_user = MerchantUser.new(params[:merchant_user])

    respond_to do |format|
      if @merchant_user.save
        format.html { redirect_to @merchant_user, notice: 'Merchant user was successfully created.' }
        format.json { render json: @merchant_user, status: :created, location: @merchant_user }
      else
        format.html { render action: "new" }
        format.json { render json: @merchant_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /merchant_users/1
  # PUT /merchant_users/1.json
  def update
    @merchant_user = MerchantUser.find(params[:id])

    respond_to do |format|
      if @merchant_user.update_attributes(params[:merchant_user])
        format.html { redirect_to @merchant_user, notice: 'Merchant user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @merchant_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merchant_users/1
  # DELETE /merchant_users/1.json
  def destroy
    @merchant_user = MerchantUser.find(params[:id])
    @merchant_user.destroy

    respond_to do |format|
      format.html { redirect_to merchant_users_url }
      format.json { head :no_content }
    end
  end
end
