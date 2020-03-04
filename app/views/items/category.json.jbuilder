json.array! @child do |child|
  json.id   child.id
  json.name child.name
end

json.array! @grandchild do |grandchild|
  json.id   grandchild.id
  json.name grandchild.name
end
