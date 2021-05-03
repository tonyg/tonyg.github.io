module Jekyll

  class XPage < Page
    def initialize(site, base, dir, name)
      @site = site
      @base = base
      @dir = dir
      @name = name

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'page.html')
      self.data['title'] = 'HELLO'
      self.content = '{{ page.title }} there'
    end
  end

  class XGenerator < Generator
    safe true

    def generate(site)
      p = XPage.new(site, site.source, '', 'p.html')
      site.pages << p
    end
  end

end
