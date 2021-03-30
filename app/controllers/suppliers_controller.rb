class SuppliersController < ApplicationController
  before_action :supplier, only: %i[show edit]

  def index
    @suppliers = Supplier.all
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_param.merge(account: current_user.default_account))

    if @supplier.save
      redirect_to supplier_path(@supplier), notice: t('.successfully_created')
    else
      render :new
    end
  end

  def destroy
    supplier.destroy

    redirect_to suppliers_path
  end

  def show
  end

  def edit
  end

  def update
    supplier.update(supplier_param)
    redirect_to suppliers_path(supplier), notice: t('.successfully_saved')
  end

  private

  def supplier
    @supplier ||= Supplier.find(params[:id])
  end

  def supplier_param
    params.require(:supplier).permit(:name)
  end
end
