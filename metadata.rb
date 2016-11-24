name             'lineinfile'
maintainer       'Vyacheslav Voronenko'
maintainer_email ''
license          'MIT'
description      'POC module to allow syntax close to ansible lineinfile module.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'
source_url       'https://github.com/softasap/sa-chef-lineinfile' if respond_to?(:source_url)
issues_url       'https://github.com/softasap/sa-chef-lineinfile/issues' if respond_to?(:issues_url)

%w(ubuntu).each do |os|
  supports os
end
