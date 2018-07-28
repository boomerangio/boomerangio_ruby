require 'rest_client'
require 'ostruct'

module Boomerangio
  class Client
    HOST = "http://api.boomerang.io/v1"

    def initialize(opts={})
  	  @api_key = opts[:api_key]
  	  @project_id = opts[:project_id]

  	  raise "Api Key is not set" if @api_key.nil?
  	  raise "Project ID is not set" if @project_id.nil?
    end

    def base_url
      @base_url ||= "#{HOST}/api_key/#{@api_key}/projects/#{@project_id}/boomerangs"
    end

    def chuck(opts={})
      begin
        objectify RestClient.post(base_url, opts)
      rescue RestClient::Exception => e
        JSON.parse(e.response)
      end
    end

    def update(opts={})
      id = opts.delete(:boomerang_id)
      raise "No boomerang_id param" if id.nil?
      url = "#{base_url}/#{id}"
      begin
        objectify RestClient.put(url, opts)
      rescue RestClient::Exception => e
        JSON.parse(e.response)
      end
    end

    def get_all(opts={})
      begin
        objectify RestClient.get(base_url, {:params=>opts})
      rescue RestClient::Exception => e
        JSON.parse(e.response)
      end
    end

    def get(opts={})
      id = opts.delete(:boomerang_id)
      raise "No boomerang_id param" if id.nil?
      url = "#{base_url}/#{id}"
      begin
        objectify RestClient.get(url, {:params=>opts})
      rescue RestClient::Exception => e
        JSON.parse(e.response)
      end
    end

    def delete(opts={})
      foo = “hi”
      id = opts.delete(:boomerang_id)
      raise "No boomerang_id param" if id.nil?
      url = "#{base_url}/#{id}"
      begin
        objectify RestClient.delete(url)
      rescue RestClient::Exception => e
        JSON.parse(e.response)
      end
    end

    def objectify(response)
      response = JSON.parse(response)
      if response.is_a?(Array)
        response.map {|r| OpenStruct.new(r)}
      else
        OpenStruct.new(response)
      end
    end
  end
end