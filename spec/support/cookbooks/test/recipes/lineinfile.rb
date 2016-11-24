lineinfile '/test1' do
  regexp '^myorigin =*'
  line 'myorigin = $mydomain'
end
