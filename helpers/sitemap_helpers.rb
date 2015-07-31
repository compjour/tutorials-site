def resource_listicle(datalist)
  datalist.map{ |item| sitemap.find_resource_by_path(item.path) }
end


def link_to_resource(resource)

end


# This is a hack: have to manually include it in every article type file...
def toc_helper
"""
#### Table of contents

* KramdownTOC
{:toc .tock}"""
end
