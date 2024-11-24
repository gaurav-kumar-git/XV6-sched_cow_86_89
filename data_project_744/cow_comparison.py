import matplotlib.pyplot as plt
import numpy as np

# Data for one child only
labels_one_child = ['Parent Initial', 'Child Before Write', 'Child After Write', 'Parent Final']
with_cow_one_child = [56634, 56566, 56465, 56634]
without_cow_one_child = [56634, 56464, 56464, 56634]

# Calculate savings for one child
savings_one_child = np.array(with_cow_one_child) - np.array(without_cow_one_child)
# Create the plot focusing on savings before the write for one child
plt.figure(figsize=(10, 5))

# Plot for one child
plt.plot(labels_one_child, with_cow_one_child, marker='o', label='With COW', linestyle='-')
plt.plot(labels_one_child, without_cow_one_child, marker='o', label='Without COW', linestyle='-')

# Annotate savings only at the "Child Before Write" stage
savings_before_write = savings_one_child[1]  # Savings before write for one child
plt.text(1, with_cow_one_child[1] + 50, f"Savings: {savings_before_write}", color='green', fontsize=10, ha='center')

# Add labels, title, and legend
plt.title("Free Pages for One Child with COW vs. Without COW (Savings Annotated Before Write)")
plt.xlabel("Stages")
plt.ylabel("Number of Free Pages")
plt.legend()
plt.grid(True)
plt.xticks(rotation=0)
plt.savefig("COW_Savings")
plt.tight_layout()

# Show the plot
plt.show()

