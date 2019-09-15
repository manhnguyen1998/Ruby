puts "Nhap tham so n:"
n = gets()
n = n.to_i
for i in 2..n
	count = 0
	for k in 2..i
		if count > 2 then
			next
		# end
		elsif i%k == 0 then
			count = count + 1
		# end
		# end
			if k == i && count < 2 then
				puts k
			end
		end
	end
# end
end