function table.shallow_copy(t)
    local t2 = {}
    for k,v in pairs(t) do
      t2[k] = v
    end
    return t2
end
  
function table.print(t)
    for k, v in ipairs(t) do
        print(k, v)
    end
end
  
  
t = {'a', 'b', 'c'}

table_copy = table.shallow_copy(t)

table_copy[4] = 'd'

print('Original table :')
table.print(t)
print('Table copied :')
table.print(table_copy)