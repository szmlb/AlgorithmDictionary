using Printf

function main()

	s = "5555555555554444" #カード番号(例)
	i, d, w = 1, 1, 1
	t = 0

	for i in 1:length(s)
		num = length(s) + 1 - i
		d = w * (s[num] - '0')  
		if d > 9
			d = d - 9
		end
		t = t + d
		w = 3 - w
	end
	if t % 10 == 0
		@printf "有効\n"
	else
		@printf "無効\n"
	end
	
	return 0

end

if occursin(PROGRAM_FILE, @__FILE__)
    main()
end
