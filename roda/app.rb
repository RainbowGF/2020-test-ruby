require "roda"
require_relative "lib/parse"

class App < Roda
    route do |r|
      r.root do
        r.redirect "/hello"
      end

      r.on "get" do


        r.on "sophisticated" do
          # r.get "rng" do
          #   "Searched for #{r.params['q']}" #=> "Searched for barbaz"
          # end
          r.is "rng" do
            if (r.params['min'].nil? || r.params['max'].nil?)
              r.get do
                "Missing arguments! rng?min=100&max=500"
              end
            elsif (!Checker.is_number?(r.params['min']) || !Checker.is_number?(r.params['max']))
              r.get do
                "One (or two) of the arguments aren't integer!"
              end
            else 
              r.get do
                @rand = r.params['min'].to_i+Random.rand(r.params['max'].to_i-r.params['min'].to_i+1)
                "Random: #{@rand}"
              end
            # r.get do
            #   "Searched for #{r.params['q']}" #=> "Searched for barbaz"
            # end
          end
        end

        r.is "rng" do
          @rand = Random.rand(4901)
          r.get do
            "Raindom number: #{@rand}"
          end
        end
      end

      r.on "cool" do
        r.get "hello", String, String do |name, surname|
          "Hello, #{name} #{surname}!"
        end
      end

      r.on "calc" do
        # r.get "min", String, String do |num_one, num_two|
        #   min = [num_one, num_two].min
        #   "#{min}"
        # end
        r.on "min" do
          r.get String, String do |num_one, num_two|
            min = [num_one, num_two].min
            "#{min}"
          end
        end
        r.get "multiply", String, String do |num_one, num_two|
          multi=num_one.to_f*num_two.to_f
          "#{multi}"
        end
      end
  
      r.on "hello" do
        @greeting = 'Hello!'
  
        # GET /hello/world request
        r.get "world" do
          "#{@greeting} world!"
        end
  
        # /hello request
        r.is do
          # GET /hello request
          r.get do
            "#{@greeting}!"
          end
  
          # POST /hello request
          # r.post do
          #   puts "Someone said #{@greeting}!"
          #   r.redirect
          # end

        end
      end
    end
  end
end