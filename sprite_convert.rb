file = File.open('sprite.txt', "r")
data = ''
data2 = ''
data3 = ''
file.each_line do |line|			#go through each line, will be stored in var "line"
	line = line.gsub(/\s/, '')
	data += line
end
file.close

puts data

while data != '' do
	extracted = /(.{2})/.match(data)		#Our regex; groups we want in ()'s
	data2 += extracted.captures[0]
	data2 += ' '
	data = data.gsub( /^../, '')
end

puts data2

data2 = data2.gsub(/00 /, '0 ')
data2 = data2.gsub(/01 /, '1 ')
data2 = data2.gsub(/02 /, '2 ')
data2 = data2.gsub(/03 /, '3 ')
data2 = data2.gsub(/10 /, '4 ')
data2 = data2.gsub(/11 /, '5 ')
data2 = data2.gsub(/12 /, '6 ')
data2 = data2.gsub(/13 /, '7 ')
data2 = data2.gsub(/20 /, '8 ')
data2 = data2.gsub(/21 /, '9 ')
data2 = data2.gsub(/22 /, 'A ')
data2 = data2.gsub(/23 /, 'B ')
data2 = data2.gsub(/30 /, 'C ')
data2 = data2.gsub(/31 /, 'D ')
data2 = data2.gsub(/32 /, 'E ')
data2 = data2.gsub(/33 /, 'F ')

data2 = data2.gsub(/\s/, '')

puts data2

data3 = '	db 0xff, 0xff, '
while data2 != '' do
	extracted = /(.{2})/.match(data2)		#Our regex; groups we want in ()'s
	data3 += '0x'
	data3 += extracted.captures[0]
	data3 += ', '
	data2 = data2.gsub( /^../, '')
end

puts data3