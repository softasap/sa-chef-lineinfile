# - {regexp: "^myhostname =*", line: "myhostname = {{postfix_hostname}}"}
lineinfile '/test1' do
  regexp '^myorigin =*'
  line 'myorigin = $mydomain'
end
