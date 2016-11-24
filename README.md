sa-chef-lineinfile
==================

OpsCode Chef proof of concept implementation of http://docs.ansible.com/ansible/lineinfile_module.html

[![Build Status](https://travis-ci.org/softasap/sa-chef-lineinfile.svg?branch=master)](https://travis-ci.org/softasap/sa-chef-lineinfile)


Example of use:

```ruby

node['sa-postfix-chef']['postfix_properties'].each do |a_property|

    lineinfile '/etc/postfix/main.cf' do
      regexp a_property['regexp']
      line   a_property['line']

    end

end

```

in example above, node['sa-postfix-chef']['postfix_properties'] is an array like:

```ruby

default['sa-postfix-chef']['postfix_properties'] = [
  { regexp: '^myhostname =*', line: "myhostname = #{default['sa-postfix-chef']['postfix_hostname']}" },
  { regexp: '^myorigin =*', line: 'myorigin = $mydomain' },
  { regexp: '^relayhost =*', line: 'relayhost = ' },
  { regexp: '^inet_interfaces =*', line: 'inet_interfaces = loopback-only' },
  { regexp: '^mydestination =*', line: 'mydestination = loopback-only' },
  { regexp: '^mydomain =*', line: "mydomain = #{default['sa-postfix-chef']['postfix_domain']}" }
]

```

