using Printf
using Random

function main()
	
	infile =  open(ARGS[1], "r")
	outfile = open(ARGS[2], "w")

	if length(ARGS) < 2 || length(ARGS) > 3 || infile == nothing || outfile == nothing  
		@printf "使用法: crypt infile outfile [key]\n"
		return 0
	end

	if length(ARGS) == 3
		Random.seed!(parse(Int, ARGS[3]))	
	end

	line_in = read(infile, String)
	line_out = ""	
	for c in line_in
		r = 256
		while r >= 256
			r = rand(0:typemax(Int)) / ( (typemax(Int) + unsigned(1)) / 256)	
		end
		line_out = line_out * string(xor(parse(Int, c), convert(Int, round(r))))	
	end
	write(outfile, line_out)

	return 0

end

if occursin(PROGRAM_FILE, @__FILE__)
    main()
end
