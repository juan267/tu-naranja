class TasksController < ApplicationController
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success]  = "Nueva actividad creada exitosamente"
      redirect_to user_path(@task.user)
    else
      flash[:danger] = "No fue posible crear actividad  debido a los siguientes errores:"
      @task.errors.full_messages.each do |message|
        flash[:warning] = "Activity: #{message}"
      end
      redirect_to user_path(@task.user)
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :priority, :user_id)
  end
end
