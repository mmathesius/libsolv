repo system 0 testtags <inline>
#>=Pkg: A 1 1 noarch
#>=Vnd: foo
#>+Prv:
#>A = 1-1
#>-Prv:
#>=Pkg: D 1 1 noarch
#>=Vnd: foo
#>+Prv:
#>D = 1-1
#>-Prv:
#>+Con:
#>A = 3-1
#>-Con:
repo available 0 testtags <inline>
#>=Pkg: A 2 1 noarch
#>=Vnd: foo
#>+Prv:
#>A = 2-1
#>-Prv:
#>=Pkg: A 3 1 noarch
#>=Vnd: bar
#>+Prv:
#>A = 3-1
#>-Prv:
system i686 rpm system

job update name A [forcebest]
result transaction,problems <inline>
#>problem 1210fdfb info package D-1-1.noarch conflicts with A = 3-1 provided by A-3-1.noarch
#>problem 1210fdfb solution 0d75a914 erase D-1-1.noarch@system
#>problem 1210fdfb solution 0d75a914 replace A-1-1.noarch@system A-3-1.noarch@available
#>problem 1210fdfb solution d85f7c4e allow A-2-1.noarch@available
#>upgrade A-1-1.noarch@system A-2-1.noarch@available

nextjob
solverflags bestobeypolicy
job update name A [forcebest]
result transaction,problems <inline>
#>upgrade A-1-1.noarch@system A-2-1.noarch@available
