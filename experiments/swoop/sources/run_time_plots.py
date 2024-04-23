import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

def plot_benchmark_times(benchmark_name):
    # Open benchmark.time file
    file_path = "{}.time".format(benchmark_name)
    with open(file_path, "r") as file:
        # Read the times from the file
        # one line contains the name of the benchmark and the next line contains the time
        # take the average of the the next 5 entries
        # we plot the times against the benchmark names
        lines = file.readlines()
        times = [float(lines[i].strip()) for i in range(1, len(lines), 2)]
        benchmarks = [lines[i].strip() for i in range(0, len(lines), 2)]
        # times = []
        # benchmarks = []
        # for i in range(0, len(lines), 6):
        #     benchmarks.append(lines[i].strip())
        #     time = 0
        #     for j in range(5):
        #         time += float(lines[i+1+j].strip())
        #     times.append(time/5)
        #     print(benchmarks[-1], times[-1])
        # Now we have the times and the benchmarks
        
        # Plot the times
        plt.figure(figsize=(10, 5))
        plt.bar(benchmarks, times)
        # add a line passing through the first value
        plt.axhline(y=times[0], color='r', linestyle='--')
        plt.xlabel(benchmark_name)
        plt.ylabel("Time (seconds)")
        plt.title("Execution time of {}".format(benchmark_name))
        plt.xticks(rotation=90)
        plt.tight_layout()
        # save the plot but don't display it
        plt.savefig("{}.png".format(benchmark_name))

# Example usage
benchmark_name = "2mm"
plot_benchmark_times(benchmark_name)