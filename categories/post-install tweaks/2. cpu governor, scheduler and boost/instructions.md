# Preface
this bit is for the scheduler, the governor and boost have their own .md's inside of the /etc folder, go do both, either or none of those first, then come back here

# CPU Scheduler
Not to be confused with the governor `powersave, ondemand, performance, schedutil, and friends` — the scheduler is a separate component that prioritizes certain tasks over others. There are many other schedulers to try other than the default CachyOS ships, in userspace, via `sched_ext`. CachyOS comes with them pre-installed and a nice gui utility where you can set them permanently, but before that - open a terminal and run ([See section 15. yay first or substitute with paru](../15.%20yay/instructions.md)):
```sh
yay -S stress-ng
```
this will install a cli benchmarking tool, with which you will be able to rank the responsiveness of the system under load. I will provide a run-through example of the scheduler I use, you should [read the description of each on the Cachy Wiki](https://wiki.cachyos.org/configuration/sched-ext/#scx_beerland) and evaluate which one is for you, both via what it says there and by doing real benchmarks.

That said, for a Ryzen 5 5600x running exactly as mine does (locked at nominal frequency 24/7 or boosting) `SchedExt GUI Manager → scx_lavd → gaming → apply` and you're done reading.

## Benchmarking example (`scx_lavd --performance`)
Open a terminal and run (**<u>READ THE COMMENT INSIDE FIRST!!!</u>**):
```sh
# Be warned that is more intense on the CPU than compiling a program is
# if your cooling is inadequate you may experience unpleasant things
# that can damage your hardware's longevity, once you're sure proceed
# with the command below
stress-ng --cpu $(nproc) --cpu-method matrixprod
```
to pin all your cores/threads to 100%, and do things you would usually do, such as browsing the internet, opening a file manager, a video player, listening to music, and so on. Once you see how horrible it all is, go back to the terminal and cancel the stress test (`ctrl+c` in the terminal).

Next, to set the current scheduler to scx_lavd gaming mode run:
```sh
sudo scx_lavd --performance
```
and repeat the benchmark, to see how pleasant it is this time around, as if you're under 0% load. Then cancel the stress test (BUT NOT THE SCHEDULER!). Next you should play some games and evaluate how it responds. Then cancel the scheduler (`ctrl + c` in the terminal).

### You should keep trying other schedulers that appear to qualify to your preferences, using the same benchmark evaluation.

## Permanence
Once happy with your scheduler of choice, use the `SchedExt GUI Manager` to set it permanently along with whatever flags you decide on.