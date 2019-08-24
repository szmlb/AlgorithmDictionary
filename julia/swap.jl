using Printf

function swap(x, y)

   return y, x

end

function main()

    a = 1
    b = 3

    a, b = swap(a, b)
    
    @printf "a=%d, b=%d" a b 

end

if occursin(PROGRAM_FILE, @__FILE__)
    main()
end
