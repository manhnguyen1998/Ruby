class MicropostsController < ApplicationController
    before_action :set_micropost, only: [:show, :edit, :update, :destroy]
  

    def index
      @microposts = Micropost.all
    end
  
    
    def show
    end
  
   
    def new
      @micropost = Micropost.new
      @users = User.all
    end
  
   
    def edit
      @users = User.all
    end
  
  
    def create
      @micropost = Micropost.new(micropost_params)
  
      respond_to do |format|
        if @micropost.save
          format.html { redirect_to @micropost, notice: 'Success create' }
          format.json { render :show, status: :created, location: @micropost }
        else
          format.html { render :new }
          format.json { render json: @micropost.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @micropost.update(micropost_params)
          format.html { redirect_to @micropost, notice: 'Success update' }
          format.json { render :show, status: :ok, location: @micropost }
        else
          format.html { render :edit }
          format.json { render json: @micropost.errors, status: :unprocessable_entity }
        end
      end
    end
  
   
    def destroy
      @micropost.destroy
      respond_to do |format|
        format.html { redirect_to microposts_url, notice: 'Success destroy.' }
        format.json { head :no_content }
      end
    end
  
    private
      def set_micropost
        @micropost = Micropost.find(params[:id])
      end
      def micropost_params
        params.require(:micropost).permit(:content, :user_id)
      end
end