def resource_listicle(datalist)
  datalist.map{ |item| sitemap.find_resource_by_path(item.path) }
end


def link_to_resource(resource)

end
