class JobsController < ApplicationController
  def search
    description = search_params['description'].gsub(' ', '+')
    location = search_params['location'].gsub(' ', '+')

    if description == '' && location == ''
      flash.alert = 'You need to input a search query!'
      redirect_to root_url and return
    end

    url = "https://jobs.github.com/positions.json?description=#{description}"
    url += "&location=#{location}" if location != ''
    url += '?full_time=true' if search_params['full_time'] == 1

    response = HTTParty.get(url)
    body = JSON.parse(response.body)

    if body.length == 0
      flash.alert = 'There were no results for that query!'
      redirect_to root_url and return
    end

    @jobs = body.map do |posting|
      job = Job.create!({
        job_type: posting['type'],
        url: posting['url'],
        posted_on: posting['created_at'],
        company: posting['company'],
        location: posting['location'],
        description: posting['description'],
        title: posting['title']
      })
    end

    render "home/index"
  end

  def delete_all
    Job.delete_all
    flash[:notice] = 'All jobs cleared!'
    redirect_to root_url
  end

  def show_all
    @jobs = Job.all
    redirect_to root_url
  end

  def show
    @job = Job.find(params[:id])
  end


  private

  def search_params
    params.require(:search).permit(:description, :location, :full_time)
  end
end
