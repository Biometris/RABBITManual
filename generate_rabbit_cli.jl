
cd(@__DIR__)
rabbitdir = abspath(joinpath("..","..","..", "RABBITCLI","src"))
isdir(rabbitdir)
mainfunls = ["simfhaplo","generate_magicped","magicsimulate",
    "parsebreedped","vcffilter", "resetmap", "magicparse","magicfilter",
    "magiccall","magicmap",
    "magicmask","magicimpute","imputeaccuracy", "magicmask_impute",
    "magicreconstruct","thinancestry", "magicscan"]
mainfilels = [string("rabbit_",i, ".jl") for i in mainfunls]
clifile = "rabbit_cli.md"
open(clifile,"w") do io
    write(io, "# RABBIT's command line interface(CLI)\n\n")
    write(io, "See section `pipeline` for the description of output files.\n\n")
    write(io, "```@contents\n")
    write(io, "Pages = [\"rabbit_cli.md\"]\n")
    write(io, "```\n")
    # msg = "!!! note \"default nothing\"\n    Keyword arguments with default values being nothing are reset internally, and the reset values are informed in the logfile. \n\n"
    # write(io, msg)
end
println("mainfilels=",mainfilels)
@time for mainfile in mainfilels    
    println("mainfile=",mainfile)
    open(clifile,"a") do io        
        write(io, string("## `", mainfile, "`\n\n"))
        write(io, "```\n")
        write(io, string("julia ", mainfile, " -h\n"))
        write(io, "```\n\n```\n")
    end
    mainfile2 = joinpath(rabbitdir,mainfile)
    run(pipeline(`julia $mainfile2 -h`; stdout=clifile, append=true))
    open(clifile,"a") do io
        write(io, "```\n\n")
    end
end
