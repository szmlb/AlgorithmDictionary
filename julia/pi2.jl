using Printf

function main()

    a = 1
    b = 1 / sqrt(2.0)
    s = 1
    t = 4
    for i in 1:3
	last = a
	a = (a + b) / 2
	b = sqrt(last * b)
	s = s - t * (a - last) * (a - last)
	t = t * 2
	@printf "%16.14f\n" (a + b) * (a + b) / s
    end

end

if occursin(PROGRAM_FILE, @__FILE__)
    main()
end
