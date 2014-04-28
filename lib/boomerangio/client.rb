module Boomerangio
  class Client
    HOST = "http://api.boomerang.io/v1"

    def initialize(opts={})
  	  @api_key = opts[:api_key]
  	  @project_id = opts[:project_id]

  	  raise "Api Key is not set" if @api_key.blank?
  	  raise "Project ID is not set" if @project_id.blank?
    end

    def base_url
      @base_url ||= "#{HOST}/api_key/#{@api_key}/projects/#{@project_id}/boomerangs"
    end

    def chuck(opts={})
      begin
        Boomerang.new RestClient.post(base_url, opts.to_json)
      rescue => e
      	return e.response
      end
    end

    def update(opts={})
      id = opts.with_indifferent_access.delete(:boomerang_id)
      raise "No boomerang_id param" if id.blank?
      url = "#{base_url}/#{id}"
      begin
        Boomerang.new RestClient.put(url, opts.to_json)
      rescue => e
        return e.response
      end
    end

    def get_all(opts={})
      begin
        Boomerang.new RestClient.get(base_url, opts.to_json)
      rescue => e
        return e.response
      end
    end

    def get(opts={})
      id = opts.with_indifferent_access.delete(:boomerang_id)
      raise "No boomerang_id param" if id.blank?
      url = "#{base_url}/#{id}"
      begin
        Boomerang.new RestClient.get(url, opts.to_json)
      rescue => e
        return e.response
      end
    end

    def delete(opts={})
      id = opts.with_indifferent_access.delete(:boomerang_id)
      raise "No boomerang_id param" if id.blank?
      url = "#{base_url}/#{id}"
      begin
        Boomerang.new RestClient.delete(url, opts.to_json)
      rescue => e
        return e.response
      end
    end

  end
end