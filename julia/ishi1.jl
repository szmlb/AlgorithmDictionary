using Printf
using Random

function main()
	
	@printf "石の数? "
	n = parse(Int, readline())

	@printf "一回に取れる最大の石の数? "
	m = parse(Int, readline())

	if n < 1 || m < 1
		return 1
	end
	my_turn = true
	while n != 0
		if my_turn
			x = (n - 1) % (m + 1)
			if x == 0
				x = 1
			end
			@printf "私は %d 個の石を取ります。\n" x
		else
			x = -1
			while x <= 0 || x > m || x > n 
				@printf "何個取りますか? "
				x = parse(Int, readline())
			end
		end
		n = n - x
		@printf "残りは %d 個です。\n" n
		my_turn = !my_turn
	end
	if my_turn
		@printf "あなたの負けです!\n"
	else
		@printf "私の負けです!\n"
	end
	return 0

end

if occursin(PROGRAM_FILE, @__FILE__)
    main()
end
