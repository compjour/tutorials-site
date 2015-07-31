require 'chronic'

class OmniResource
  attr_reader :title, :description, :date, :url, :path, :summary
  def initialize(resource)
    @url    = resource.url
    @path   = resource.path
    if resource.respond_to?(:data)
      _d = ohash(resource.data)
      @_data = _d
    else
      _d = resource
      @_data = ohash() # empty hash
    end

    @date   = Chronic.parse(_d.date)
    @description = _d.description
    @title  = _d.title
    @summary = _d.summary
  end

  def data
    @_data
  end
end


def OmniResource(obj)
  if obj.is_a?(OmniResource)
    return obj
  elsif obj.is_a?(Hash)
    return OmniResource.new(ohash(obj))
  else
    return OmniResource.new(obj)
  end
end


def ohash(obj = nil)
  if obj.nil?
    Thor::CoreExt::HashWithIndifferentAccess.new()
  else
    Thor::CoreExt::HashWithIndifferentAccess.new(obj)
  end
end



class OmniResourceError < StandardError; end
