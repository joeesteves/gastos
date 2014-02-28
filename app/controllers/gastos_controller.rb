class GastosController < ApplicationController
  before_action :set_gasto, only: [:show, :edit, :update, :destroy]

  # GET /gastos
  # GET /gastos.json
  def index
 		@gasto = Gasto.new
    @gasto.fecha = Date.today
		unless params[:desde] && params[:hasta]
			@totalCliente = Gasto.mios(@current_user.id).group(:cliente_id).sum('COALESCE(ingreso, 0)- COALESCE(egreso, 0)')
			@gastos = Gasto.mios(@current_user.id).order(:fecha)
			@saldoInicial = 0
			hoy = Date.today()
			@desde = Date.new(hoy.year,hoy.month,1)
			@hasta = Date.new(hoy.year,hoy.month,-1)
		else
			@desde = params[:desde].to_date
			@hasta = params[:hasta].to_date
			@totalCliente = Gasto.mios(@current_user.id).where("fecha >= '#{params[:desde]}' and fecha <=  '#{params[:hasta]}'").group(:cliente_id).sum('COALESCE(ingreso, 0)- COALESCE(egreso, 0)')
			@gastos = Gasto.mios(@current_user.id).where("fecha >= '#{params[:desde]}' and fecha <=  '#{params[:hasta]}'").order(:fecha)
			@saldoInicial = Gasto.mios(@current_user.id).where("fecha < '#{params[:desde]}'").sum('COALESCE(ingreso, 0)- COALESCE(egreso, 0)').to_f rescue nil
		end
	end

  # GET /gastos/1
  # GET /gastos/1.json
  def show
  end

  # GET /gastos/new
  def new
    @gasto = Gasto.new
    @gasto.fecha = Date.today
	end

  # GET /gastos/1/edit
	def edit
		@gasto = Gasto.find(params[:id])

		respond_to do |format|	
			format.js
		end
	end

	# POST /gastos
	# POST /gastos.json
  def create
    @gasto = Gasto.new(gasto_params)
		@gasto.user_id = @current_user.id
    respond_to do |format|
      if @gasto.save
        format.html { redirect_to :back }
        format.json { render action: 'show', status: :created, location: @gasto }
      else
        format.html { render action: 'new' }
        format.json { render json: @gasto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gastos/1
  # PATCH/PUT /gastos/1.json
  def update
    respond_to do |format|
      if @gasto.update(gasto_params)
        format.html { redirect_to :back }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gasto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gastos/1
  # DELETE /gastos/1.json
  def destroy
    @gasto.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gasto
      @gasto = Gasto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gasto_params
      params.require(:gasto).permit(:fecha, :concepto, :ingreso, :egreso, :cliente_id, :user_id)
    end
end
