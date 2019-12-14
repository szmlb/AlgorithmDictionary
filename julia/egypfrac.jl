using Printf

function main()

    @printf "分子 m = " 
    m = parse(Int, readline())
    @printf "分母 n = " 
    n = parse(Int, readline())

    @printf "%d/%d \n" m n

    while n % m != 0

    	q = round(Int, n / m) + 1
    	@printf "1/%d + " q
	m = m * q  - n
	n = n * q

    end

    @printf "1/%d \n" n / m

end

if occursin(PROGRAM_FILE, @__FILE__)
    main()
end
