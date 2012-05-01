class DiceController < ApplicationController
  def index
    if user_signed_in?
      user = current_user
      @team_name = user.name
      @current_name = Station.find(user.place).station_name
    end
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def result
    @number = rand(6) + 1
    user = current_user
    @current_place = Station.find(user.place).station_name
    @team_name = current_user.name
    if user.direction == 1
      dest = (user.place += @number).modulo(29)
    else
      dest = (user.place -= @number).modulo(29)
    end

    if(dest == 0)
      user.place = 29
    else
        user.place = dest
    end

    user.save

    station = Station.find(user.place)
    tasks = Task.find_all_by_station(user.place)
    task = tasks[rand(tasks.length)]
    @dest_name = station.station_name
    @task_title = task.title

    if(task.moveto != 0)
      user.place = task.moveto
      user.save
    end

    respond_to do |format|
      format.html # result.html.erb
    end
  end
end
