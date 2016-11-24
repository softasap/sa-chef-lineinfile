lineinfile '/test1' do
  regexp '^myorigin =*'
  with 'myorigin = $mydomain'
end
