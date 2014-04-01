class MerchantsController < ApplicationController
  before_filter :admin_user, only: [:new, :create, :destroy]
  before_filter :adminOrMerchant_user, only: [:edit, :update]


  
  def index
    @merchants = Merchant.all
    @cards = Card.all


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @merchants }
    end
  end

  # GET /merchants/1
  # GET /merchants/1.json
  def show
    @merchant = Merchant.find(params[:id])
    @credits_count = Credit.where(:user_id => current_user.id, :merchant_id => params[:id]).count
    @credits_sum = Credit.where(:user_id => current_user.id, :merchant_id => params[:id]).sum(:amount) 
    @rewards = Reward.where(:merchant_id => @merchant.id).order('credits desc')

    if current_user.role = "user"
    @credits = Credit.where(:user_id => current_user.id, :merchant_id => @merchant.id).last(4)
      
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @merchant }
    end
  end

  # GET /merchants/new
  # GET /merchants/new.json
  def new
    @merchant = Merchant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @merchant }
    end
  end

  # GET /merchants/1/edit
  def edit

    if current_user.try(:isMerchantUser?)
      @merchant = Merchant.find(current_user.merchant_id)
    else
      @merchant = Merchant.find(params[:id])
    end
  end

  # POST /merchants
  # POST /merchants.json
  def create
    @merchant = Merchant.new(params[:merchant])

    respond_to do |format|
      if @merchant.save
        format.html { redirect_to @merchant, notice: 'Comercio creado exitosamente!' }
        format.json { render json: @merchant, status: :created, location: @merchant }
      else
        format.html { render action: "new" }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /merchants/1
  # PUT /merchants/1.json
  def update
    @merchant = Merchant.find(params[:id])

    respond_to do |format|
      if @merchant.update_attributes(params[:merchant])
        format.html { redirect_to merchants_setup_path, notice: 'Comercio actualizado exitosamente' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  def setup
    @merchant = Merchant.find(current_user.merchant_id)
    @team = User.where(:merchant_id => current_user.merchant_id)

  end

  # DELETE /merchants/1
  # DELETE /merchants/1.json
  def destroy
    @merchant = Merchant.find(params[:id])
    @merchant.destroy

    respond_to do |format|
      format.html { redirect_to merchants_url }
      format.json { head :no_content }
    end
  end

  private
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

    def adminOrMerchant_user
      redirect_to(root_path) unless (current_user.admin? | current_user.isMerchantUser?)
    end

    def signed_in_user
      unless signed_in?
        redirect_to signin_url, notice: "Por favor inicia sesion." 
    end
  end


end
