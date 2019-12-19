using Printf

function main()

    N = 4
    c = Array{Int}(undef, N+2)

    for k in 1:N+1
	c[k] = 0
    end
    i = 0
    while true
	@printf "%3d:" i
	i = i + 1

	k = N
	while k >= 1
		@printf " %d" c[k]
		k = k - 1
	end
	@printf "\n"
	k = 1
	while c[k] == k
		c[k] = 0
		k = k + 1
	end
	c[k] = c[k] + 1
	
	if k > N
		break
	end

    end

end

if occursin(PROGRAM_FILE, @__FILE__)
    main()
end
