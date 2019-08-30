using Printf
using Random

function main()
	
	N = 3 # 各性の人数
	boy = Array{Int}(undef, N+1)
	girl = Matrix{Int}(undef, N+1, N+1)
	position = Array{Int}(undef, N+1)
	rank = Matrix{Int}(undef, N+1, N+1)

	for g in 2:N+1 # 各女性の好み
		for r in 2:N+1
			rank[g, parse(Int, readline())] = r	
		end
		boy[g] = 1
		rank[g, 1] = N + 2 # 番人
	end
	for b in 2:N+1 # 各男性の好み
		for r in 2:N+1
			girl[b, r] = parse(Int, readline())	
		end
		position[b] = 1
	end
	for b in 2:N+1
		s = b
		while s != 1
			position[s] = position[s] + 1
			g = girl[s, position[s]]
			if rank[g, s] < rank[g, boy[g]]
				t = boy[g]
				boy[g] = s
				s = t
			end
		end
	end
	for g in 2:N+1
		@printf "女 %d - 男 %d\n" g boy[g]
	end

	return 0

end

if occursin(PROGRAM_FILE, @__FILE__)
    main()
end
