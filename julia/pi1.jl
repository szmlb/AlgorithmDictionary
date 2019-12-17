using Printf

function main()

    p = 0
    k = 1
    t = Float64(16.0) / Float64(5.0)
    while true
	last = p
	p = p +  t / k
	t = t / (- Float64(5.0) * Float64(5.0))
	k = k + 2	

	if p == last
		break
	end
    end

    k = 1
    t = Float64(4.0) / Float64(239.0)
    while true
	last = p
	p = p -  t / k
	t = t / (- Float64(239.0) * Float64(239.0))
	k = k + 2	

	if p == last
		break
	end
    end

    @printf "%lf" p

end

if occursin(PROGRAM_FILE, @__FILE__)
    main()
end
