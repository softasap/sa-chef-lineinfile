name 'lineinfile'
maintainer 'Vyacheslav Voronenko'
maintainer_email 'git@voronenko.info'
license 'MIT'
description      'POC module to allow syntax close to ansible lineinfile module.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.2'
source_url       'https://github.com/softasap/sa-chef-lineinfile' if respond_to?(:source_url)
issues_url       'https://github.com/softasap/sa-chef-lineinfile/issues' if respond_to?(:issues_url)

supports 'ubuntu', '>= 12.04'
