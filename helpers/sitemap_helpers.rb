require 'lib/omni_resource'

def resource_listicle(datalist)
  datalist.map do |item|
    find_sitemap_webpage_by_path(item.path)
  end
end


def find_sitemap_webpage_by_path(path)
  # deal with abbreviated resource names, e.g.
  # /tutorials/hello-world
  # as opposed to:
  # tutorials/hello-world.html, which middleman::sitemap knows
  if path =~ /^\// && path !~ /\.html$/
    _rx = path =~ /\/$/ ? -2 : -1 # remove trailing slash
    path = path[1.._rx] + '.html'
  end

  r = sitemap.find_resource_by_path(path)
  if r.nil?
    raise StandardError, "The Middleman Site Manager could not find: #{path}"
  else
    return OmniResource(r)
  end
end

# helper method
# returns a OmniResource whether obj is a String or some other kind of object
def omni_find(obj)
  if obj.is_a?(String)
    o = find_sitemap_webpage_by_path(obj)
  else
    o = OmniResource(obj)
  end
end

def omni_link_to(obj)
  o = omni_find(obj)
  link_to o.title, o.url
end


OMNI_LINK_BOX_TEMPLATE = %Q{
<div class="link-box">
  <a href="<%=url%>">
    <span class="title"><%=title%></span>
  </a>
  <span class="description"><%=description%></span>
</div>
}

def omni_link_box(obj)
  o = omni_find(obj)
  title = o.title
  description = o.description
  url = o.url

  return  ERB.new(OMNI_LINK_BOX_TEMPLATE).result(binding)
end


# This is a hack: have to manually include it in every article type file...
def toc_helper
"""
#### Table of contents

* KramdownTOC
{:toc .tock}"""
end
