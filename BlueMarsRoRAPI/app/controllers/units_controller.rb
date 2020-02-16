class UnitsController < ApplicationController
    def index
        if params[:sort].nil?
          @units = Unit.order(:created_at).page(params[:page]).per(15)
        else 
          @units = Unit.order(params[:sort]).page(params[:page]).per(15)
        end
        render json: {units: @units, meta: { current: Unit.page(params[:page]).current_page ,total: Unit.page.total_pages, records: Unit.count}}, status: :ok
      end
    
      def show
        render json: @unit, status: :ok
      end
    
      def create
        @unit = Unit.new(unit_params)
        if @unit.save
          render json: @unit, status: :created
        else
          render json: { errors: @unit.errors.full_messages },
                 status: :unprocessable_entity
        end
      end
    
      def update
        unless @unit.update(unit_params)
          render json: { errors: @unit.errors.full_messages },
                 status: :unprocessable_entity
        end
      end
    
      def destroy
        @unit= Unit.find(params[:id])
        @unit.destroy
        render status: :no_content
      end
      
      def search 
        @units =  Unit.find_all_by_title_or_region(params[:title], params[:region])
        render json: @units, status: :ok
      end
      private
      
      def find_unit
        @user = Unit.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          render json: { errors: 'Unit not found' }, status: :not_found
      end
    
      def unit_params
        params.permit(
          :image, :title, :description, :region, :cp, :price, :score
        )
      end
end
