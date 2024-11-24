import pandas as pd
import matplotlib.pyplot as plt

# Load the CSV file
file_path = "process_data_cpu_5P.csv"  # Update with the correct file path
df = pd.read_csv(file_path)

# Plot the data
plt.figure(figsize=(10, 6))
for pid in df["Process ID"].unique():
    pdata = df[df["Process ID"] == pid]
    plt.plot(pdata["Ticks"], pdata["Queue"], label=f"Process ID {pid}")

# Add labels and legend
plt.title("CPU Bounded Process Queues Over Time")
plt.xlabel("Ticks")
plt.ylabel("Queue")
plt.yticks(range(1, 5))  # Assuming queues range from 1 to 4
plt.legend(title="Processes", loc='lower right')
plt.grid(True)
plt.savefig('CPU_Bounded_5_Processes!') 
plt.show()
