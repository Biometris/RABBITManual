using MagicBase
cd(@__DIR__)

magicped = generate_magicped(;
  designcodes=["P1/P2=>DH", "2ril-self3", "ibd=1.0||mapexpansion=5.0","P4/3/P4//P2/P3=>3"],
  founders = ["NA","P1||P3","P3||P4||P5","NA"],
  subpopsizes=20*ones(4)
)
savemagicped("example_ped_junc.csv", magicped)

MagicBase.pedfile_designcode2ped("example_ped_junc.csv"; outfile = "example_ped.csv")


magicped = readmagicped("example_ped.csv")
plotmagicped(magicped)


