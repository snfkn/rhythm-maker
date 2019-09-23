require 'sinatra'

def rhythm_randomizer(rhythm)
    new_rhythm = Array.new
    for note in rhythm do
        unless rand(1..3).even?
            new_rhythm.push("#{note}")
        else
            new_rhythm.push("<span id=\"off\">#{note}</span>")
        end
    end
    return new_rhythm.join("  ")
end

get '/' do
    @rhythm = ["1", "&", "2", "&", "3", "&", "4", "&"]
    @rhythm = erb rhythm_randomizer(@rhythm)
    erb :index, :layout => :template
end

not_found do
    redirect '/'
  end
