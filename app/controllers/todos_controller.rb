class TodosController < ApplicationController
  #before_action :set_todo, only: [:show, :update, :destroy]

  # GET /todos
  # GET /todos.json
  def index
    @todos = Todo.all
    render json: @todos
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    @todo=Todo.find(params[:id])
    render json: @todo
  end

  def create
    @todo=Todo.new(todo_params)
    @todos=Todo.all
    if @todo.save
      render status: 200,json:{
                message: "succesfully created",
        todo_list: @todo
        }
    else
      render json: @todo.errors
    end

  end

  def update
    @todo=Todo.find(params[:id])
    if @todo.update_attributes(todo_params)
      render status: 200,json:{
        message:"succesfully updated",
        todo_list:@todo
      }.to_json

    else
      render json: @todo.errors
      
    end
  end


  def destroy
    @todo=Todo.find(params[:id])
    @todo.destroy
    @todos=Todo.all
    render status: 200 ,json:{
      message:"succesfully deleted",
      todo_list: @todos
    }
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:title, :completed, :order)
    end
end
