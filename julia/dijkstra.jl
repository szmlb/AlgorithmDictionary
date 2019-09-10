using Printf

function readweight(nmax, weight)            # データ入力

    n = parse(Int, readline())
    if n > nmax 
        n = 0
	return 0
    end
    for i in 1:n
        for j = 1:n
	       weight[i, j] = typemax(Int32)
	end
    end

    while true
	arr = [parse(Int, y) for y in split(readline())]
	if length(arr) != 3
		break
	end
        i, j, x = arr 
        weight[i, j] = weight[j, i] = x
    end
    @printf "データ weight(i, j)\n"
    for i = 1:n
        for j = 1:n
            if weight[i, j] < typemax(Int32)
                @printf "%3d" weight[i, j]
            else
                @printf "  ∞"
	    end
        end
        @printf "\n"
    end

    return n
end

function main()

	NMAX = 100                 		 # 点の数の上限
	START = 1 				 # 出発点
	weight = Array{Int}(undef, NMAX + 1, NMAX + 1)  # 辺の重み


	visited = Array{Bool}(undef, NMAX+1)
	distance = Array{Int64}(undef, NMAX+1)
	prev = Array{Int64}(undef, NMAX+1)
    
	n = readweight(NMAX, weight) # n: 点の数
	for i in 1:n
		visited[i] = false
		distance[i] = typemax(Int32)
	end
	distance[START] = 0
	next = START
	while true 
		i = next
		visited[i] = true
		min = typemax(Int32)
		for j in 1:n
			if visited[j]
				continue
			end
			if weight[i, j] < typemax(Int32) && distance[i] + weight[i, j] < distance[j]
				distance[j] = distance[i] + weight[i, j]
				prev[j] = i
			end
			if distance[j] < min
				min = distance[j]
				next = j
			end
		end
		
		if min >= typemax(Int32)
			break	
		end
	end
    	@printf "点  直前の点  最短距離\n"
	for i in 1:n
		if i != START && visited[i]
		    	@printf "%2d%10d%10d\n" i prev[i] distance[i]
		end
	end
	return 0
end

if occursin(PROGRAM_FILE, @__FILE__)
    main()
end
