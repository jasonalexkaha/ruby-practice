class TasksController < ApplicationController
    def index    
    end

    def create
        @list = List.find(params[:list_id])
        @task = @list.tasks.new(task_params)
        
        if @task.save
            redirect_to @list
        else
            redirect_to :controller => 'lists', :action => 'show', :id => @list.id
        end                
    end   

    def destroy
        @list = List.find(params[:list_id])
        @task = @list.tasks.find(params[:id])

        @task.destroy

        redirect_to list_path(@list)
    end

    private
        def task_params
            params.require(:task).permit(:name, :done)
        end    
end