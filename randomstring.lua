local function rstr(leng)
  local charset = {}
  for i=0,9 do table.insert(charset,i) end
  for i=65,90 do table.insert(charset,string.char(i)) end
  for i=97,122 do table.insert(charset,string.char(i)) end
  for i=1,math.random(2,10) do
    math.randomseed(math.random(-os.time(),os.time()))
  end
  local lenm = tonumber(leng)
  if lenm == nil then return("") end
  if lenm <= 0 then lenm = 1 end
  local array = {}
  if lenm == 1 then
    array[1] = charset[math.random(#charset)]
    return(array[1])
  end
  for i=1,lenm do
    array[i] = charset[math.random(#charset)]
  end
  return table.concat(array),array
end

return rstr
