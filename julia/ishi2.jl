using Printf
using Random

function main()
	
	f = Array{Int}(undef, 21)
	f[1] = f[2] = 1
	for i in 3:20
		f[i] = f[i-1] + f[i-2]
	end
	@printf "石の数 (2...1000)? "
	n = parse(Int, readline())
	if n < 2 || n > 1000
		return 1
	end
	max = n - 1
	
	my_turn = true
	while n != 0

		@printf "%d 個まで取れます。\n" max
		if my_turn
			x = n

			i = 20
			while x != f[i]
				if x > f[i]	
					x = x - f[i]
				end
				i = i - 1
			end
			if x > max
				x = 1
			end
			@printf "私は %d 個の石を取ります。\n" x
		else
			x = -1
			while x < 1 || x > max
				@printf "何個取りますか? "
				x = parse(Int, readline())
			end
		end
		n = n - x
		max = 2 * x
		if max > n
			max = n
		end
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
