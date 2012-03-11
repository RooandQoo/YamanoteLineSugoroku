class DiceController < ApplicationController
  def index
    user = User.first
    @team_name = user.name
    @current_name = Station.find(user.place).station_name
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def result
    @number = rand(6) + 1
    user = User.find(1)
    @team_name = user.name
    if user.direction == true
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
