require "sinatra/base"

module Rack
  module Test

    class FakeApp < Sinatra::Default
      head "/" do
        "meh"
      end

      get "/" do
        "Hello, GET: #{params.inspect}"
      end

      get "/redirect" do
        redirect "/redirected"
      end

      get "/redirected" do
        "You've been redirected"
      end

      get "/cookies/show" do
        request.cookies.inspect
      end
      
      get "/COOKIES/show" do
        request.cookies.inspect
      end
      
      get "/not-cookies/show" do
        request.cookies.inspect
      end
      
      get "/cookies/set-secure" do
        raise if params["value"].nil?
        
        response.set_cookie("secure-cookie", :value => params["value"], :secure => true)
        "Set"
      end
      
      get "/cookies/set-simple" do
        raise if params["value"].nil?
        
        response.set_cookie "simple", params["value"]
        "Set"
      end
      
      get "/cookies/set" do
        raise if params["value"].nil?
        
        response.set_cookie("value", {
          :value => params["value"],
          :path => "/cookies",
          :expires => Time.now + 10
        })
        "Set"
      end
      
      get "/cookies/set-uppercase" do
        raise if params["value"].nil?
        
        response.set_cookie("VALUE", {
          :value => params["value"],
          :path => "/cookies",
          :expires => Time.now + 10
        })
        "Set"
      end

      post "/" do
        "Hello, POST: #{params.inspect}"
      end

      put "/" do
        "Hello, PUT: #{params.inspect}"
      end

      delete "/" do
        "Hello, DELETE: #{params.inspect}"
      end
    end

  end
end