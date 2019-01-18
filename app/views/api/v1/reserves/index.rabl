object @reserves
attributes :id, :name

node :start_date do |model|
  model.start_date.strftime("%Y-%m-%d %T") unless model.start_date.blank?
end
node :end_date do |model|
  model.end_date.strftime("%Y-%m-%d %T") unless model.end_date.blank? 
end

child :user do
    attributes :id, :name
end
