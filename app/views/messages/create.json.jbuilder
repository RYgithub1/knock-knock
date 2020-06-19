


# @pair.messages.each do |message|
# json.id @message.id

json.content @message.content

# json.image @message.image
json.image @message.image_url
# json.image @message.image.url

json.created_at @message.created_at.strftime("%Y/%m/%d(%a) %H:%M(%Z)")

